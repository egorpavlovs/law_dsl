require_relative 'load_relatives'
require_relative 'services/translate_service.rb'

class Dsl
  include LoadRelatives

  def self.make_decision(request_data, scenario, response_language)
    scenario_language = File.basename(scenario).split('.').first
    dsl = Dsl.new(request_data, scenario_language, response_language)
    lines =  File.open(scenario){ |file| file.read }.delete("\n").split("- ").delete_if(&:empty?)
    # p self.ancestors
    results = lines.compact.map do |line|
    # p self.methods
      # p line
      dsl.instance_eval line
    end
    dsl.join_scenario_results(results)
  end

  def initialize(request_data, scenario_language, response_language)
    @request_hash = request_data
    @translate_scenario = TranslateService.new(scenario_language)
    @translate_response = TranslateService.new(response_language)
    method_names_with_translates = @translate_scenario.get_method_names_with_translate()
    method_names_with_translates.each do |method_name, method_name_translate|
      self.class.send(:alias_method, method_name_translate.to_sym, method_name.to_sym)
    end
    args_with_translate = @translate_scenario.get_args_with_translate()
    args_with_translate.each do |arg, translate|
      create_method(translate.to_sym) { eval(arg) }
    end
  end

  def create_method(name, &block)
    self.class.send(:define_method, name, &block)
  end

  def format_result_methods_response(method_name, allowed, response)
    DslOperand.new(allowed, response, method_name)
  end

  def join_scenario_results(dsl_operands)
    reject_dsl_operands = dsl_operands.map { |dsl_operand| dsl_operand unless dsl_operand.allowed }.compact

    responses = if reject_dsl_operands.empty?
      dsl_operands.map do |dsl_operand|
        get_responses(dsl_operand)
      end
    else
      reject_dsl_operands.map do |reject_dsl_operand|
        get_responses(reject_dsl_operand)
      end
    end

    {
      "allowed"=>reject_dsl_operands.empty?,
      "responses"=>responses.flatten
    }
  end

  def get_responses(dsl_operand)
    if dsl_operand.response.is_a?(String)
        @translate_response.from_key_path(["methods", dsl_operand.method_name, "responses", dsl_operand.response].join("."))
    else
      dsl_operand.response.map{ |dsl_operand_response|
        get_responses(dsl_operand_response)
      }
    end
  end

  def method_missing(m, *args, &block)
    # p self.methods
    # p 'm'
    @request_hash[m.to_s]
  end

end

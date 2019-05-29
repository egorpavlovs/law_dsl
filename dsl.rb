require_relative 'load_relatives'
require_relative 'services/translate_service.rb'

class Dsl
  include LoadRelatives

  def self.make_decision(request_data, scenario, response_language)
    scenario_language = File.basename(scenario).split('.')[1]
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

  attr_reader :scenario_language
  attr_reader :response_language

  def initialize(request_data, scenario_language, response_language)
    @request_hash = request_data
    @scenario_language = scenario_language
    @response_language = response_language
    @translate_scenario = TranslateService.new(scenario_language)
    @translate_response = TranslateService.new(response_language)
    @all_scenarios = Dir['scenarios/*.md']

    #переписать покороче и покрасивее создание алиасов и методов
    method_names_with_translates = @translate_scenario.get_method_names_with_translate()
    method_names_with_translates.each do |method_name, method_name_translate|
      self.class.send(:alias_method, method_name_translate.to_sym, method_name.to_sym)
    end
    args_with_translate = @translate_scenario.get_args_with_translate()
    args_with_translate.each do |arg, translates|
      # res = @request_hash[arg] || [arg, @request_hash]
      res = [arg, @request_hash]
      create_method(arg.to_sym) { res }
      translates.each{ |translate_arg| create_method(translate_arg.to_sym) { res } }
    end
    scenarios_with_translate = @translate_scenario.get_scenarios_with_translate()
    scenarios_with_translate.each do |scenario, translate|
      create_method(translate.to_sym) { scenario.to_sym }
    end
  end

  def create_method(name, &block)
    self.send(:define_singleton_method, name, &block)
  end

  def format_result_methods_response(method_name, allowed, response)
    DslOperand.new(allowed, response, method_name)
  end

  def combine_dsl_operands(dsl_operands)
    res = dsl_operands.first
    for i in 1..dsl_operands.size-2
      res = res.&(dsl_operands[i+1])
    end
    res
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
    DslOperand.new(reject_dsl_operands.empty?, responses.compact, nil)
  end

  def get_responses(dsl_operand)
    if dsl_operand.is_a?(String)
      dsl_operand
    elsif dsl_operand.response.is_a?(String)
        @translate_response.from_key_path(["methods", dsl_operand.method_name, "responses", dsl_operand.response].join(".")) || dsl_operand.response
    else
      dsl_operand.response.map{ |dsl_operand_response|
        get_responses(dsl_operand_response)
      }.join(", ")
    end
  end
end

require_relative 'load_relatives'
require_relative 'services/translate_service.rb'

class Dsl
  include LoadRelatives

  def self.make_decision(request_data, scenario)
    scenario_language = File.basename(scenario).split('.').first
    dsl = Dsl.new(request_data, scenario_language)
    lines =  File.open(scenario){ |file| file.read }.delete("\n").split("- ").delete_if(&:empty?)
    results = lines.compact.map do |line|
      p line
      dsl.instance_eval line
      # do
      #   # Этот блок надо передать в методы, которые работают из-за instance_eval
      #   method_name =__method__.to_s
      #   translate_arg = @translate_scenario.method_arg_from_value(method_name, arg.to_s)
      #   @request_hash[translate_arg]
      # end
    end
    dsl.join_scenario_results(results)
  end

  # def self.new_method(name, &block)
  #   define_method(name, &block)
  # end

  # def new_method(name, &block)
  #   self.class.send(:define_method, name, &block)
  # end

  def initialize(request_data, scenario_language)
    @request_hash = request_data
    @translate_scenario = TranslateService.new(scenario_language)
  end

  def format_result_methods_response(allowed, response = nil)
    # response = "Разрешено" if allowed
    DslOperand.new(allowed, response)
  end

  def join_scenario_results(dsl_operands)
    reject_dsl_operands = dsl_operands.map { |dsl_operand| dsl_operand unless dsl_operand.allowed }.compact
    response = (reject_dsl_operands.empty? ? dsl_operands : reject_dsl_operands).map { |dsl_operand| dsl_operand.response }.join(', ')
    {
      "allowed"=>reject_dsl_operands.empty?,
      "response"=>response
    }
  end

  def method_missing(m, *args, &block)
    # m = @request_hash[m.to_s]

    m
  end

end

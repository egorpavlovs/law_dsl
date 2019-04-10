require_relative 'load_relatives'

class Dsl
  include LoadRelatives

  def self.make_decision(request_data, scenario)
    dsl = Dsl.new(request_data)
    lines =  File.open(scenario){ |file| file.read }.delete("\n").split(";")
    results = lines.compact.map{ |line| dsl.instance_eval(line)}
    dsl.join_scenario_results(results)
  end

  def initialize(request_data)
    @request_hash = request_data
  end

  def format_result_methods_response(allowed, response = nil)
    response = "Разрешено" if allowed
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
    m = @request_hash[m.to_s]
  end

end

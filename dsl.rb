require_relative 'load_relatives'
require_relative 'services/translate_service.rb'

class Dsl
  include LoadRelatives

  def self.make_decision(request_data, scenario)
    scenario_language = File.basename(scenario).split('.').first
    dsl = Dsl.new(request_data, scenario_language)
    lines =  File.open(scenario){ |file| file.read }.delete("\n").split("- ").delete_if(&:empty?)
    results = lines.compact.map do |line|
      # p line
      dsl.instance_eval line
    end
    dsl.join_scenario_results(results)
  end

  def initialize(request_data, scenario_language)
    @request_hash = request_data
    @translate_scenario = TranslateService.new(scenario_language)
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
        @translate_scenario.from_key_path(["methods", dsl_operand.method_name, "responses", dsl_operand.response].join("."))
    else
      dsl_operand.response.map{ |dsl_operand_response|
        get_responses(dsl_operand_response)
      }
    end
  end

  def method_missing(m, *args, &block)
    m || @request_hash[m.to_s]
  end

end

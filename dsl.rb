require_relative 'load_relatives'
require "i18n"

class Dsl
  include LoadRelatives

  def self.make_decision(request_data, scenario)
    scenario_language = File.basename(scenario).split('.').first
    # load default en and scenario language
    I18n.load_path << File.expand_path("config/locales") + "/en.yaml"
    I18n.load_path << File.expand_path("config/locales") + "/#{scenario_language}.yaml"

    dsl = Dsl.new(request_data)
    lines =  File.open(scenario){ |file| file.read }.delete("\n").split("- ").delete_if(&:empty?)
    results = lines.compact.map do |line|
      p line
      eng_translate = I18n.t(line, :en)
      p eng_translate
      # set default_locale from scenario for methods with responses
      I18n.default_locale = scenario_language.to_sym
      dsl.instance_eval(eng_translate)
    end
    dsl.join_scenario_results(results)
  end

  def initialize(request_data)
    @request_hash = request_data
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
    m = @request_hash[m.to_s]
  end

end

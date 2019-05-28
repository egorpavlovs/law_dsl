module ApplicationMethods

  def execute_scenario(*args)
    scenario_name = args.first
    data = {}
    args.drop(1).each do |arg|
      data.merge!(make_data_to_new_scenario(arg))
    end
    res = @all_scenarios.map do |scenario_path|
      if File.basename(scenario_path, ".*").split(".").first == scenario_name.to_s
        Dsl.make_decision(data, scenario_path, @response_language)
      end
    end
    combine_dsl_operands(res.compact)
  end

  def make_data_to_new_scenario(data)
    key_name = data.first
    new_data = data.last[key_name]
    {
      key_name => new_data
    }
  end

end

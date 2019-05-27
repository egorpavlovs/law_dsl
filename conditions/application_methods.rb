module ApplicationMethods

  def execute_scenario(*args)
    @all_scenarios.each do |scenario_path|
      scenario_name = args.first.to_s
      data = args.last
      if File.basename(scenario_path, ".*").split(".").first == scenario_name
        p scenario_path
        Dsl.make_decision(data, scenario_path, @response_language)
      end
    end
  end

end

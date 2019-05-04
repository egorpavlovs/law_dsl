module ApplicationMethods

  def get_data_for_method_arg(method_name, method_arg)
    translate_arg = @translate_scenario.method_arg_from_value(method_name, method_arg.to_s)
    @request_hash[translate_arg]
  end

end
require 'yaml'
class TranslateService

  def initialize(language)
    @translate_config = YAML::load(File.open("config/locales/#{language}.yaml"))
    raise "Not find file for #{language} language, check config/locales" if @translate_config.empty?
  end

  def from_key_path(path)
    keys = path.split('.')
    res = @translate_config.dig(*keys)
    if res.is_a?(Hash)
      raise "Dont completed path #{path} for translate"
    else
      res
    end
  end

  def method_arg_from_value(method_name, value)
    agrs_schema = @translate_config.dig(*%W(methods #{method_name} args))
    res = invert_schema(agrs_schema).dig(value).flatten.first
    if res.empty?
      raise "Not find #{value} in #{method_name}"
    else
      res
    end
  end

  def get_method_names_with_translate()
    res = {}
    @translate_config['methods'].keys.each do |method_name|
      res.merge!({
        method_name => @translate_config.dig(*%W(methods #{method_name} name)).to_s
      })
    end
    res
  end

  def get_args_with_translate()
    res = {}
    @translate_config['methods'].keys.each do |method_name|
      @translate_config.dig(*%W(methods #{method_name} args))&.each do |arg, translate|
        res.merge!({
          arg => translate
        })
      end
    end
    res
  end

  def get_scenarios_with_translate()
    res = {}
    @translate_config['scenarios'].each do |scenario_name, translate_scenario_name|
      res.merge!({
        scenario_name => translate_scenario_name.to_s
      })
    end
    res
  end

  def invert_schema(h, arr=[])
    h.each_with_object({}) { |(k,v),g| g.update((v.is_a?(Hash)) ? invert_schema(v, arr + [k]) : { v=>[arr+[k]] }) { |_,o,n| o+n } }
  end

end
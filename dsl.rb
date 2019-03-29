class Dsl

  def initialize(request_data)
    @request_hash = request_data
  end

  def apply_methods(scenario)
    lines =  File.open(scenario){ |file| file.read }.split(";")
    results = lines.map do |line|
      eval(line)
    end
    p results
    # p eval(results.join(" && "))
  end

  def физическое_лицо?(applicant)
    allowed = ["физическое лицо", "физ лицо"].include?(applicant)
    response = allowed ? allowed : "Не явлется физическим лицом"
    format_result_methods_response(allowed, response)
  end

  def юридическое_лицо?(applicant)
    allowed = ["юридическое лицо", "юр лицо"].include?(applicant)
    response = allowed ? allowed : "Не явлется юридическим лицом"
    format_result_methods_response(allowed, response)
  end

  def format_result_methods_response(allowed, response = nil)
    if allowed
      allowed
    else
      {
        "response"=>response,
        "allowed"=>allowed
      }
    end
  end

  def method_missing(m, *args, &block)
    m = @request_hash["#{m}"]
  end

end

request = {
  "заявитель"=>"физическое лицо"
}

dsl = Dsl.new(request)
dsl.apply_methods('doc')
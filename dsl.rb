require_relative 'conditions/applicant_methods'
# require_relative 'conditions/inti.rb'

class Dsl
  include ApplicantMethods
  # require :ApplicantMethods

  def self.run(request_data)
    Dsl.new(request_data)
  end

  def initialize(request_data)
    # Dir["conditions/*.rb"].each {|file| require_relative file }
    @request_hash = request_data
  end

  def apply_scenario(scenario)
    lines =  File.open(scenario){ |file| file.read }.split(";")
    results = lines.map do |line|
      eval(line)
    end
    # p results
    eval(results.join(" && "))
  end

  def format_result_methods_response(allowed, response = nil)
    allowed
  end

  def method_missing(m, *args, &block)
    m = @request_hash["#{m}"]
  end

end

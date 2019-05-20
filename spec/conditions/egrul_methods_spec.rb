require 'json'
load 'dsl.rb'

RSpec.describe ApplicantMethods do
  it 'information_from_egrul_represented?' do
    request_data = JSON.parse(File.read('spec/data/egrul_result_query_data.json'))
    dsl = Dsl.new(request_data, 'ru', 'ru')
    check_allowed(dsl, :information_from_egrul_represented?, :egrul_query_result)
  end

  def check_allowed(dsl, method_name, field_name)
    allowed = dsl.send(method_name, dsl.send(field_name)).allowed
    expect(allowed).to be true
  end
end

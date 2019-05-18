load 'dsl.rb'

RSpec.describe ApplicantMethods do
  applicant_source = {
    natural_person?: 'natural person',
    legal_entity?: 'legal entity',
    individual_entrepreneur?: 'individual entrepreneur',
    agent?: 'agent'
  }
  applicant_source.each do |method_name, data|
    it method_name.to_s do
      request_data = {'applicant'=> data.to_s}
      dsl = Dsl.new(request_data, 'ru', 'ru')
      check_allowed(dsl, method_name.to_sym, :applicant)
    end
  end

  it 'applicant_identity_esia?' do
    request_data = {'esia_data'=> 11}
    dsl = Dsl.new(request_data, 'ru', 'ru')
    check_allowed(dsl, :applicant_identity_esia?, :esia_data)
  end

  def check_allowed(dsl, method_name, field_name)
    allowed = dsl.send(method_name, dsl.send(field_name)).allowed
    expect(allowed).to be true
  end
end
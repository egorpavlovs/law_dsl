load 'dsl.rb'

RSpec.describe DocumentsMethods do

  it 'statement_sni_filed?' do
    request_data = {'statement_sni'=> 'statement_sni'}
    dsl = Dsl.new(request_data, 'ru', 'ru')
    check_allowed(dsl, 'statement_sni_filed?', :statement_sni)
  end

  it 'technical_inventory_documents_represented?' do
    request_data = {
      'technical_inventory_documents'=> [{
        'name' => "plan",
        'document' => 'document'
      }]
    }
    dsl = Dsl.new(request_data, 'ru', 'ru')
    allowed = dsl.technical_inventory_documents_represented?(dsl.send(:technical_inventory_documents), ['plan']).allowed
    expect(allowed).to be true
  end

  def check_allowed(dsl, method_name, field_name)
    allowed = dsl.send(method_name, dsl.send(field_name)).allowed
    expect(allowed).to be true
  end
end
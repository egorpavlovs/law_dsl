load 'dsl.rb'

RSpec.describe FilesMethods do
  files_sources = [
    {
      method_name: 'photos_initial_situation_presented?',
      arg_name: 'photos_initial_situation',
      arg: 'file_url'
    },
    {
      method_name: 'situational_plan_presented?',
      arg_name: 'situational_plan',
      arg: 'file_url'
    },
    {
      method_name: 'photos_projected_constructions_presented?',
      arg_name: 'photos_projected_constructions',
      arg: 'file_url'
    }
  ]
  files_sources.each do |files_source|
    it files_source[:method_name] do
      request_data = {files_source[:arg_name].to_s=> files_source[:arg].to_s}
      dsl = Dsl.new(request_data, 'ru', 'ru')
      check_allowed(dsl, files_source[:method_name].to_sym, files_source[:arg_name].to_sym)
    end
  end

  it 'topographic_plan_with_scale_presented?' do
    request_data = {
      'topographic_plan_with_scale'=> {
        'file' => "file",
        'scale' => '1:200'
      }
    }
    dsl = Dsl.new(request_data, 'ru', 'ru')
    allowed = dsl.topographic_plan_with_scale_presented?(dsl.send(:topographic_plan_with_scale), '1:200').allowed
    expect(allowed).to be true
  end

  def check_allowed(dsl, method_name, field_name)
    allowed = dsl.send(method_name, dsl.send(field_name)).allowed
    expect(allowed).to be true
  end
end
require 'thor'

class ApiDef::CLI < Thor
  desc "build FILE", "build API specification for FILE"
  option :template, {
    aliases: '-t',
    default: 'markdown',
    required: true,
    type: :string,
    enum: ApiDef::Template.supported_templates,
    desc: 'Output template'
  }
  def build(file)
    spec = load_spec file
    tpl = ApiDef::Template.find(options[:template]).new
    STDOUT.write tpl.render(spec)
  end

  desc "mock FILE", "start a mock server for FILE"
  def mock(file)
    spec = load_spec file
    app  = ApiDef::Mock.create_application spec
    app.run!
  end

  private
  def load_spec(file)
    content = File.open(file).read.to_s
    spec = ApiDef::Specification.new
    spec.instance_eval content, file
  end

end

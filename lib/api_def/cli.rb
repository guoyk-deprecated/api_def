require 'thor'

class ApiDef::CLI < Thor
  desc "build FILE", "build API specification from FILE"
  option :template, {
    aliases: '-t',
    default: 'markdown',
    required: true,
    type: :string,
    enum: [:markdown, :html],
    desc: 'Output template'
  }
  def build(file)
    content = File.open(file).read.to_s
    spec = ApiDef::Specification.new
    spec.instance_eval content, file
    tpl = ApiDef::Template.find(options[:template]).new
    STDOUT.write tpl.render(spec)
  end
end

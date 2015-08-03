class ApiDef::Template
  autoload :Markdown, 'api_def/template/markdown'
  autoload :Html,     'api_def/template/html'

  def self.find(name)
    case name.to_s
    when 'html'
      ApiDef::Template::Html
    when 'markdown'
      ApiDef::Template::Markdown
    end
  end

  def render(spec)
    raise "Implementation required"
  end
end

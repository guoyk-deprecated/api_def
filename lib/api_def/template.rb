class ApiDef::Template
  autoload :Markdown, 'api_def/template/markdown'
  autoload :Html,     'api_def/template/html'
  autoload :Textile,  'api_def/template/textile'

  def self.supported_templates
    ['html', 'markdown', 'textile']
  end

  def self.find(name)
    case name.to_s
    when 'html'
      ApiDef::Template::Html
    when 'markdown'
      ApiDef::Template::Markdown
    when 'textile'
      ApiDef::Template::Textile
    end
  end

  def render(spec)
    raise "Implementation required"
  end
end

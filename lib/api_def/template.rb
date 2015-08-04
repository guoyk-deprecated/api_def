class ApiDef::Template
  SUPPORTED_TEMPLATES = ['html', 'markdown', 'textile', 'confluence']

  SUPPORTED_TEMPLATES.each do |tpl|
    self.autoload tpl.capitalize.to_sym, "api_def/template/#{tpl}"
  end

  def self.find(name)
    self.const_get name.capitalize
  end

  def render(spec)
    raise "Implementation required"
  end
end

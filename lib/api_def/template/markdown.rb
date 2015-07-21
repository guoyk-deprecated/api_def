class ApiDef::Template::Markdown < ApiDef::Template
  def render(spec)
    puts spec.inspect
  end
end

class ApiDef::Template::Html < ApiDef::Template
  def render(spec)
    puts spec.inspect
  end
end

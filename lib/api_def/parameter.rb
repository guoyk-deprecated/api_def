class ApiDef::Parameter < ApiDef::Element
  attr_uno :optional, :type

  def on_options(options)
    super
    self.optional options[:optional]
    self.type options[:type]
  end
end

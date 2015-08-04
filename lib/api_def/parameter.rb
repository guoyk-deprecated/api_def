class ApiDef::Parameter < ApiDef::Element
  attr_uno :optional, :type, :value

  def on_options(options)
    super
    self.optional options[:optional]
    self.type options[:type]
    self.value options[:value]
  end
end

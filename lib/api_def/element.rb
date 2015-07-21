class ApiDef::Element
  include ApiDef::Support::AttrUno
  include ApiDef::Support::AttrArray
  include ApiDef::Support::AttrUnoArray

  attr_uno :name, :desc

  def initialize(name = nil)
    self.name name
    yield self if block_given?
  end
end

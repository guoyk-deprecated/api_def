# ApiDef::Entry means a entry of api
class ApiDef::Entry < ApiDef::Element
  attr_array :patterns

  def pattern(name)
    # New
    pattern = ApiDef::Pattern.new name
    # Yield
    yield pattern if block_given?
    # Add
    self.patterns << pattern
    # Return
    self
  end
end

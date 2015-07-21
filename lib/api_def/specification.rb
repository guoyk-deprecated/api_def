class ApiDef::Specification < ApiDef::Element
  attr_uno    :version
  attr_array  :groups

  # Create a group
  def group(name)
    # Create
    group = ApiDef::Group.new(name)
    # Yield
    yield group if block_given?
    # Add to array
    self.groups << group
    # Return self for chain
    self
  end
end

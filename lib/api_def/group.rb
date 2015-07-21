# ApiDef::Group means a group of api entries
class ApiDef::Group < ApiDef::Element
  attr_array  :entries

  # Add a entry
  def entry(name)
    # Create entry
    entry = ApiDef::Entry.new(name)
    # Yield
    yield entry if block_given?
    # Add to array
    self.entries << entry
    # Return self for chain
    self
  end
end

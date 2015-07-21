# ApiDef::Group means a group of api entries
class ApiDef::Group
  def initialize(name, desc = nil)
    @name = name
    @desc = desc
  end
end

# ApiDef::Pattern means a possible access pattern of a api
class ApiDef::Pattern < ApiDef::Element
  attr_array :requests, :responses

  def request
  end

  def response
  end
end

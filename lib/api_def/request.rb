# ApiDef::Request means a request made to a api entry
class ApiDef::Request < ApiDef::Element
  attr_uno_array :param, class: 'ApiDef::Parameter'
end

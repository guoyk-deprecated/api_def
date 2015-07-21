# ApiDef::Pattern means a possible access pattern of a api
class ApiDef::Pattern < ApiDef::Element
  attr_uno_array :request, class: 'ApiDef::Request'
  attr_uno_array :response,class: 'ApiDef::Response'
end

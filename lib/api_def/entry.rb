# ApiDef::Entry means a entry of api
class ApiDef::Entry < ApiDef::Element
  attr_uno :method, :path

  attr_uno_array :request, class: 'ApiDef::Request'
  attr_uno_array :response,class: 'ApiDef::Response'
end

# ApiDef::Entry means a entry of api
class ApiDef::Entry < ApiDef::Element
  attr_uno_array :pattern, class: 'ApiDef::Pattern'
end

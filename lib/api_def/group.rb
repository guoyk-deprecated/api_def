# ApiDef::Group means a group of api entries
class ApiDef::Group < ApiDef::Element
  attr_uno_array :entry, store: :entries, class: 'ApiDef::Entry'
end

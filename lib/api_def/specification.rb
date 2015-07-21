class ApiDef::Specification < ApiDef::Element
  attr_uno        :version
  attr_uno_array  :group,   class: 'ApiDef::Group'
end

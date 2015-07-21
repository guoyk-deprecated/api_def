module ApiDef
  VERSION="1.0.0"
  # CLI
  autoload :CLI,      'api_def/cli'
  autoload :Template, 'api_def/template'

  # Specification and DSL
  autoload :Specification,  'api_def/specification'

  # ApiDef models
  autoload :Element,  'api_def/element'

  autoload :Group,    'api_def/group'
  autoload :Entry,    'api_def/entry'
  autoload :Pattern,  'api_def/pattern'
  autoload :Request,  'api_def/request'
  autoload :Parameter,'api_def/parameter'
  autoload :Response, 'api_def/response'

  # Supports
  module Support
    autoload :AttrUno,  'api_def/support/attr_uno'
    autoload :AttrArray,'api_def/support/attr_array'
  end
end

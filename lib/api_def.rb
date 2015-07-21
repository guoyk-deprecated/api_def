module ApiDef
  VERSION="1.0.0"
  # CLI
  autoload :CLI,      'api_def/cli'
  autoload :Template, 'api_def/template'

  # Specification and DSL
  autoload :Specification,  'api_def/specification'
  autoload :DSL,            'api_def/dsl'

  # ApiDef models
  autoload :Group,    'api_def/group'
  autoload :Entry,    'api_def/entry'
  autoload :Pattern,  'api_def/pattern'
  autoload :Request,  'api_def/request'
  autoload :Parameter,'api_def/parameter'
  autoload :Response, 'api_def/response'
end

require 'json'
require 'sinatra/base'

class ApiDef::Mock

  def self.create_application(spec, port)
    Class.new(Sinatra::Base) do
      configure do
        set     :bind, '0.0.0.0'
        set     :port, port
        disable :protection
        settings.add_charset << "application/json"
      end
      before do
        content_type :json
      end
      # root for description
      get "/" do
        content_type :html
        tpl = ApiDef::Template::Html.new
        tpl.render spec
      end
      # entries
      spec.groups.each do |group|
        group.entries.each do |entry|
          self.send(entry.method.to_sym, entry.path) do
            ::JSON.pretty_generate(entry.responses.sample.body)
          end
        end
      end
    end
  end

end

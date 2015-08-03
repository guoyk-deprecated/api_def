require 'sinatra/base'

class ApiDef::Mock

  def self.create_application(spec)
    Class.new(Sinatra::Base) do
      configure do
        set :public_folder, File.expand_path("../../public", __FILE__)
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
            JSON.pretty_generate(entry.responses.sample.body)
          end
        end
      end
    end
  end

end

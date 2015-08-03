require 'sinatra/base'

class ApiDef::Mock

  def self.create_application(spec)
    Class.new(Sinatra::Base) do
      configure do
        disable :protection
        settings.add_charset << "application/json"
      end
      before do
        content_type :json
      end
      spec.groups.each do |group|
        group.entries.each do |entry|
          self.send(entry.method.to_sym, entry.path) do
            entry.responses.sample.body.target!
          end
        end
      end
    end
  end

end

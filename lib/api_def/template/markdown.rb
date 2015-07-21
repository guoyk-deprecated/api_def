require 'erb'

class ApiDef::Template::Markdown < ApiDef::Template
  TEMPLATE_FILE= <<-EOF
  # <%= spec.name %>
  # <%= spec.version %>

  <% spec.groups.each do |group| %>
  ## <%= group.name %>

  <%= group.desc %>
    <% group.entries.each do |entry| %>
  ### <%= entry.name %>

  <%= entry.desc %>
    <% end %>
  <% end %>
  EOF

  def render(_spec)
    clazz = ::ERB.new(TEMPLATE_FILE, nil, '<>').def_class
    clazz.class_eval do
      def initialize(_spec)
        @spec = _spec
      end

      def spec
        @spec
      end
    end
    clazz.new(_spec).result
  end
end

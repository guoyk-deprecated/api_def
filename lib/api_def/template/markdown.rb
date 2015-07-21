require 'erb'

class ApiDef::Template::Markdown < ApiDef::Template
  TEMPLATE_FILE= %{
# <%= spec.name %>
# <%= spec.version %>

<% spec.groups.each do |group| -%>
## <%= group.name %>

<%= group.desc %>
    <% group.entries.each do |entry| %>
### <%= entry.name %>

<%= entry.desc %>

#### <%= entry.path %> [<%= entry.method.to_s.upcase %>]
      <% entry.requests.each do |request| -%>
        <% if entry.requests.count > 1 -%>

##### Request: <%= request.name %>

<%= request.desc %>

<% request.params.each do |param| -%>
+ `<%= param.name %>`, <%= param.type %>, <%="Optional, " if param.optional%><%= param.desc %>
<% end -%>

        <% end -%>
      <% end -%>
    <% end -%>
  <% end -%>
}

  def render(_spec)
    clazz = ::ERB.new(TEMPLATE_FILE, nil, "-").def_class
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

require 'erb'
require 'json'

class ApiDef::Template::Confluence < ApiDef::Template
  TEMPLATE_FILE= %{
h1. <%= spec.name %>

h1. <%= spec.version %>

<% spec.elements.each do |ele| -%>
h2. <%= ele.name %>

<%= ele.desc %>
<% end -%>

<% spec.groups.each do |group| -%>
h2. <%= group.name %>
----

<%= group.desc %>
    <% group.entries.each do |entry| %>
h3. <%= entry.name %>
----

<%= entry.desc %>

h4. {{<%= entry.method.to_s.upcase %>}} {{<%= entry.path %>}}
      <% entry.requests.each do |request| -%>

h4. Request <%= request.name %>

<%= request.desc %>

<% request.params.each do |param| -%>
* {{<%= param.name %>}}<%= " = {{" + param.value.to_s + "}}" if param.value %><%= ", " + param.type.to_s if param.type %><%=", Optional" if param.optional %><%= ", " + param.desc.to_s if param.desc %>
<% end -%>

      <% end -%>

      <% entry.responses.each do |response| -%>

h4. Response <%= response.name %>

<%= response.desc %>

{code:language=javascript}
<%= JSON.pretty_generate(response.body) %>
{code}

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

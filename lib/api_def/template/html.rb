require 'redcarpet'

class ApiDef::Template::Html < ApiDef::Template

  def render(spec)
    tpl = ApiDef::Template::Markdown.new
    md  = tpl.render(spec)
    content = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
    :autolink => true,
    :space_after_headers => true,
    :fenced_code_blocks => true
    ).render(md)
    %{
      <!doctype html>
      <html>
      <head>
      <meta name="content-type" content="text/html;charset=utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>#{spec.name}</title>
      <style>
      body {
        font-family: sans-serif;
        min-width: 200px;
        max-width: 790px;
        margin: 0 auto;
        padding: 30px;
      }
      pre {
        color: white;
        background-color: black;
        background-clip: padding-box;
        border-radius: 4px;
        padding: 6px;
      }
      code {
        color: white;
        background-color: black;
        background-clip: padding-box;
        border-radius: 4px;
        padding-left: 2px;
        padding-right:2px;
      }
      </style>
      </head>
      <body>
      <article class="markdown-body">
      #{content}
      </article>
      </body>
      </html>
    }
  end
end

require 'lib/string_extensions'

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
data.talks.each do |talk|
  proxy "/talks/#{talk.title.to_slug}.html", "/talk.html", locals: { talk: talk }
end

ignore "/talk.html"

###
# Helpers
###
activate :blog do |blog|
  blog.name = "articles"
  blog.permalink = "{title}.html"
  blog.prefix = "articles"
  blog.sources = "{title}.html"
end

activate :blog do |blog|
  blog.name = "journal"
  blog.prefix = "journal"
  blog.sources = "{year}-{month}-{day}-{title}.html"
  blog.tag_template = "tag.html"
end

page "/feed.xml", layout: false
# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
helpers do
  def video(url)
    case url
    when /youtube/
      id = url.split("=").last
      domain = "//youtube.com/embed"
    when /vimeo/
      id = url.split('/').last
      domain = "//player.vimeo.com/video"
    end
    # TODO: This iframe tag doesnt close
    # tag :iframe, src: src
    src = [domain, id].join('/')
    "<iframe frameborder=\"0\" src=\"#{src}\">Hello</iframe>"
  end
end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end

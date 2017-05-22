# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.these-walls.net"

SitemapGenerator::Sitemap.create_index = true

SitemapGenerator::Sitemap.create do
  add '/listen'
  add '/about'
  add '/contact'
end

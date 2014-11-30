# Change this to your host. See the readme at https://github.com/lassebunk/dynamic_sitemaps
# for examples of multiple hosts and folders.
host "www.uk-franchise.co.uk"

sitemap :site do
	url root_url, last_mod: Time.now, change_freq: "weekly", priority: 1.0
	url posts_url, last_mod: Time.now, change_freq: "weekly", priority: 1.0
	url events_url, last_mod: Time.now, change_freq: "monthly", priority: 1.0
	url accounting_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url agriculture_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url automotive_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url beverage_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url B2B_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url cafeandcoffee_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url care_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url chemical_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url childrenandbabies_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url cleaning_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url communications_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url computers_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url construction_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url consultancy_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url logistics_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url educationandtraining_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url electrical_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url entertainment_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url enviromental_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url estateagents_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url fashion_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url financial_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url food_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url health_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url hirerental_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url hospitality_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url indoorpropertyservices_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url outdoorpropertyservices_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url internet_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url legal_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url manafacture_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url pets_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url promotional_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url print_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url repairandmaintenance_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
  url investment1, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
  url investment2, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
  url investment3, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
  url investment4, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
  Post.published.each do |post|
		url post, last_mod: post.updated_at, priority: 1.0
	end
  Listing.published.each do |listing|
		url listing, last_mod: listing.updated_at, priority: 1.0
	end
end

ping_with "http://#{host}/sitemap.xml" if Rails.env=='production'


# You can have multiple sitemaps like the above – just make sure their names are different.

# Automatically link to all pages using the routes specified
# using "resources :pages" in config/routes.rb. This will also
# automatically set <lastmod> to the date and time in page.updated_at:
#
#   sitemap_for Page.scoped

# For products with special sitemap name and priority, and link to comments:
#
#   sitemap_for Product.published, name: :published_products do |product|
#     url product, last_mod: product.updated_at, priority: (product.featured? ? 1.0 : 0.7)
#     url product_comments_url(product)
#   end

# If you want to generate multiple sitemaps in different folders (for example if you have
# more than one domain, you can specify a folder before the sitemap definitions:
# 
#   Site.all.each do |site|
#     folder "sitemaps/#{site.domain}"
#     host site.domain
#     
#     sitemap :site do
#       url root_url
#     end
# 
#     sitemap_for site.products.scoped
#   end

# Ping search engines after sitemap generation:
#
#   ping_with "http://#{host}/sitemap.xml"
# Change this to your host. See the readme at https://github.com/lassebunk/dynamic_sitemaps
# for examples of multiple hosts and folders.
host "www.uk-franchise.co.uk"

sitemap :site do
	url root_url, last_mod: Time.now, change_freq: "weekly", priority: 1.0
	url posts_url, last_mod: Time.now, change_freq: "weekly", priority: 1.0
	url events_url, last_mod: Time.now, change_freq: "monthly", priority: 1.0
	url industry_accounting_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url industry_agriculture_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url industry_automotive_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url industry_beverage_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url industry_B2B_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url industry_cafeandcoffee_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url industry_care_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url industry_chemical_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url industry_childrenandbabies_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url industry_cleaning_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url industry_communications_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url industry_computers_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url industry_construction_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url industry_consultancy_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url industry_logistics_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url industry_educationandtraining_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url industry_electrical_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url industry_entertainment_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url industry_enviromental_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url industry_estateagents_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url industry_fashion_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url industry_financial_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url industry_food_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url industry_health_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url industry_hirerental_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url industry_hospitality_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url industry_indoorpropertyservices_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url industry_outdoorpropertyservices_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url industry_internet_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url industry_legal_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url industry_manafacture_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url industry_pets_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url industry_promotional_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url industry_print_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
	url industry_repairandmaintenance_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
  url industry_investment1_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
  url industry_investment2_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
  url industry_investment3_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
  url industry_investment4_url, last_mod: Time.now, change_freq: "Weekly", priority: 1.0
  Post.all.each do |post|
		url post, last_mod: post.updated_at, priority: 1.0
	end
  Listing.all.each do |listing|
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
require 'rubygems'
require 'sitemap_generator'

# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.uk-franchise.co.uk"
 
# pick a place safe to write the files
SitemapGenerator::Sitemap.public_path = 'tmp/'
 
# store on S3 using Fog
SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new
 
# inform the map cross-linking where to find the other maps
SitemapGenerator::Sitemap.sitemaps_host = "http://#{ENV['FOG_DIRECTORY']}.s3.amazonaws.com/"
 
# pick a namespace within your bucket to organize your maps
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.create do
  add root_path, :lastmod => Time.now, :changefreq => 'weekly', :priority => 1
  add posts_path, :lastmod => Time.now, :changefreq => 'weekly', :priority => 1
  add events_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1 
	add industry_accounting_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
	add industry_agriculture_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
	add industry_automotive_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
	add industry_beverage_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
	add industry_B2B_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
	add industry_cafeandcoffee_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
	add industry_care_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
	add industry_chemical_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
	add industry_childrenandbabies_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
	add industry_cleaning_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
	add industry_communications_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
	add industry_computers_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
	add industry_construction_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
	add industry_consultancy_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
	add industry_logistics_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
	add industry_educationandtraining_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
	add industry_electrical_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
	add industry_entertainment_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
	add industry_enviromental_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
	add industry_estateagents_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
	add industry_fashion_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
	add industry_financial_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
	add industry_food_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
	add industry_health_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
	add industry_hirerental_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
	add industry_hospitality_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
	add industry_indoorpropertyservices_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
	add industry_outdoorpropertyservices_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
	add industry_internet_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
	add industry_legal_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
	add industry_manafacture_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
	add industry_pets_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
	add industry_promotional_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
	add industry_print_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
	add industry_repairandmaintenance_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
  add industry_investment1_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
  add industry_investment2_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
  add industry_investment3_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
  add industry_investment4_path, :lastmod => Time.now, :changefreq => 'monthly', :priority => 1
  Post.all.each do |post|
		add post_path(post), :lastmod => post.updated_at, :changefreq => 'monthly', :priority => 1
	end
	Listing.all.each do |listing|
		add listing_path(listing), :lastmod => listing.updated_at, :priority => 1
	end
	Event.all.each do |event|
		add event_path(event), :lastmod => event.updated_at, :priority => 1
	end
end

SitemapGenerator::Sitemap.ping_search_engines # Not needed if you use the rake tasks

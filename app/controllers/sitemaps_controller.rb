class SitemapsController < ApplicationController
 
  def show
    redirect_to "http://dw7w7srwr6gns.cloudfront.net/sitemaps/sitemap.xml.gz"
  end
 
end
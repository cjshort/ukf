class HomeController < ApplicationController
  def index
  	@latest = Listing.where(approved: true).order('created_at DESC').limit(5)
  	@spotlight = Listing.where(approved: true).order('created_at DESC').limit(2)
  	@events = Event.where(approved: true).order('created_at DESC').limit(3)
  end

  def search
  	@query = params[:search]
  	@search = Listing.search do
  		fulltext params[:search]  		
  	end
  	@result = @search.results
  end

end

class HomeController < ApplicationController
  def index
  	@latest = Listing.where(approved: true).order('created_at DESC').limit(5)
  	@spotlight = Listing.where(approved: true).order('created_at DESC').limit(2)
  	@events = Event.where(approved: true).order('created_at DESC').limit(3)
  end

def search
  @query = params[:search]
  if params[:search].nil?
    @result = []
  else
    @result = Listing.search(params[:search]).records
  end
end

end

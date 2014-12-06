class HomeController < ApplicationController

  def robots
  end

  def index
  	@latest = Listing.where(approved: true, topfranchise: true).order('created_at DESC').limit(3)
  	@spotlight = Listing.where(approved: true, spotlight: true).order('created_at DESC').limit(2)
  	@events = Event.where(approved: true).order('created_at DESC').limit(3)
    @post1 = Post.where(:approved => true).last
  end

  def search
    @query = params[:search]
    if params[:search].blank?
      @result = Listing.search.all.records
    else
      @result = Listing.search(params[:search]).records
    end
  end

  def comingsoon
  end

end

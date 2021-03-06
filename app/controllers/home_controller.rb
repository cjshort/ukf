class HomeController < ApplicationController

  def robots
  end

  def index
  	@latest = Listing.where(approved: true, topfranchise: true).order('created_at DESC').limit(5)
  	@spotlight = Listing.where(approved: true, spotlight: true).order('created_at DESC').limit(3)
  	@events = Event.all
    @post1 = Post.where(:approved => true).last
    @additional1 = Post.where(:approved => true).offset(1).last
    @additional2 = Post.where(:approved => true).offset(2).last
    @additional3 = Post.where(:approved => true).offset(3).last
  end

  def search
    @query = params[:search]
    if params[:search].nil?
      @result = Listing.search.all.records
    else
      @result = Listing.search(params[:search]).records
    end
  end

  def comingsoon
  end

end

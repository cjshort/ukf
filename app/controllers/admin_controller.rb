class AdminController < ApplicationController
   before_filter :authenticate_admin!,
    :only => [:overview, :listings, :events, :moneyzone]

  def overview
  end

  def listings
  	@listings = Listing.where(approved: false).reverse
  end

  def events
  	@events = Event.where(approved: false).reverse
  end

  def moneyzone
    @post = Post.where(approved: false).reverse
  end
end

class AdminController < ApplicationController

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

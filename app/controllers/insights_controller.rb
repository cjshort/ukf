class InsightsController < ApplicationController
	before_action :authenticate_franchise!

  def dashboard
  	@listing = Listing.find_by(franchise_id: current_franchise.id)
  	@leads = Lead.where(listing_id: @listing.id)
  end

  def leads
  	@listing = Listing.find_by(franchise_id: current_franchise.id)
		@leads = Lead.where(listing_id: @listing.id)
  end

  def editlisting
  end
end

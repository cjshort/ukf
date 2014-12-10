class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	before_filter :spotlightnav, :randomfranchise

	def spotlightnav
	  @spotlightnav = Listing.where(approved: true, spotlight: true).order('created_at DESC').limit(2)
	end

	def randomfranchise
		@randomfranchise = Listing.limit(1).order("RAND()").first
	end

  def industrylist
	  @industrylist = [["Accounting", "Accounting"], ["Agriculture", "Agriculture"], ["Automotive", "Automotive"], ["Beverage","Beverage"], ["B2B","B2B"], ["Cafe And Coffee","Cafe And Coffee"], ["Care","Care"], ["Chemical","Chemical"], ["Children And Babies","Children And Babies"], ["Cleaning","Cleaning"], ["Communications","Communications"], ["Computers","Computers"], ["Consultancy","Consultancy"], ["Logistics","Logistics"], ["Education And Training","Education And Training"], ["Electrical","Electrical"], ["Entertainment","Entertainment"], ["Enviromental","Enviromental"], ["Estate Agents","Estate Agents"], ["Fashion","Fashion"], ["Financial","Financial"], ["Food","Food"], ["Health","Health"], ["Hire And Rental","Hire And Rental"], ["Hospitality","Hospitality"], ["Indoor Property Services","Indoor Property Services"], ["Outdoor Property Services","Outdoor Property Services"], ["Internet","Internet"], ["Legal","Legal"], ["Manafacture","Manafacture"], ["Pets","Pets"], ["Promotional","Promotional"], ["Print","Print"], ["Repair And Maintenance","Repair And Maintenance"]]
	end

end

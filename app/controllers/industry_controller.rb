class IndustryController < ApplicationController
  def accounting
    @listing = Listing.where(category: "Accounting", approved: true)
  end

  def agriculture
    @listing = Listing.where(category: "Agriculture")
  end

  def automotive
    @listing = Listing.where(category: "Automotive")
  end

  def beverage
    @listing = Listing.where(category: "Beverage")
  end

  def B2B
    @listing = Listing.where(category: "B2B")
  end

  def cafeandcoffee
    @listing = Listing.where(category: "Cafe And Coffee")
  end

  def care
    @listing = Listing.where(category: "Care")
  end

  def chemical
    @listing = Listing.where(category: "Chemical")
  end

  def childrenandbabies
    @listing = Listing.where(category: "Children And Babies")
  end

  def cleaning
    @listing = Listing.where(category: "Cleaning")
  end

  def communications
    @listing = Listing.where(category: "Communications")
  end

  def computers
    @listing = Listing.where(category: "Computers")
  end

  def construction
    @listing = Listing.where(category: "Construction")
  end

  def consultancy
    @listing = Listing.where(category: "Consultancy")
  end

  def logistics
    @listing = Listing.where(category: "Logistics")
  end

  def educationandtraining
    @listing = Listing.where(category: "Education And Training")
  end

  def electrical
    @listing = Listing.where(category: "Electrical")
  end

  def entertainment
    @listing = Listing.where(category: "Entertainment")
  end

  def enviromental
    @listing = Listing.where(category: "Environmental")
  end

  def estateagents
    @listing = Listing.where(category: "Estate Agents")
  end

  def fashion
    @listing = Listing.where(category: "Fashion")
  end

  def financial
    @listing = Listing.where(category: "Financial")
  end

  def food
    @listing = Listing.where(category: "Food")
  end

  def health
    @listing = Listing.where(category: "Health")
  end

  def hirerental
    @listing = Listing.where(category: "Hire And Rental")
  end

  def hospitality
    @listing = Listing.where(category: "Hospitality")
  end

  def indoorpropertyservices
    @listing = Listing.where(category: "Indoor Property Services")
  end

  def outdoorpropertyservices
    @listing = Listing.where(category: "Outdoor Property Services")
  end

  def internet
    @listing = Listing.where(category: "Internet")
  end

  def legal
    @listing = Listing.where(category: "Legal")
  end

  def manafacture
    @listing = Listing.where(category: "Manafacture")
  end

  def pets
    @listing = Listing.where(category: "Pets")
  end

  def promotional
    @listing = Listing.where(category: "Promotional")
  end

  def print
    @listing = Listing.where(category: "Print")
  end

  def repairandmaintenance
    @listing = Listing.where(category: "Repair And Maintenance")
  end
end

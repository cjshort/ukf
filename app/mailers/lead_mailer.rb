class LeadMailer < ActionMailer::Base
  default from: "admin@uk-franchise.co.uk"

  def lead_mailer(listing, lead)
  	@listing = listing
  	@lead = lead
  	mail(to: @listing.leadrecepient, subject: "Your franchise has a new lead courtesy of uk-franchise.co.uk")
  end
end

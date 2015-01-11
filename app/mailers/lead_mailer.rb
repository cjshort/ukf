class LeadMailer < ActionMailer::Base
  default from: "admin@uk-franchise.co.uk"

  def lead_mailer(listing, lead)
  	@listing = listing
  	@lead = lead
  	mail(to: @listing.franchise.email, subject: "New lead from UK-Franchise.co.uk")
  end
end

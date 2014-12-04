class GenericMailer < ActionMailer::Base
  default from: "contact@uk-franchise.com"

	def contact_mailer(contact)
		@contact = contact
		mail(from: "#{@contact.email}", to: "admin@uk-franchise.co.uk", subject: "Contact form enquiry | #{@contact.fullname}")
	end
end

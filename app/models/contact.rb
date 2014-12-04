class Contact < ActiveRecord::Base
	validates_acceptance_of :toc, :on => :create, :accept => true
	validates :fullname, :email, :query, presence: true
	validates :fullname, :email, :query, length: {minimum: 0, maximum: 5000}
end

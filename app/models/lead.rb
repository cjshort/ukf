class Lead < ActiveRecord::Base
	belongs_to :listing
	
	validates_acceptance_of :toc, :on => :create, :accept => true
  validates :fullname, :email, :city, :region, :postcode, presence: true
  validates :fullname, :email, :city, :region, :postcode, length: { minimum: 0, maximum: 200 }
end
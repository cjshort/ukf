class Story < ActiveRecord::Base
	belongs_to :listing
	
  validates :fullname, :email, :jobrole, :story, presence: true
  validates :story, uniqueness: true
  validates :fullname, :email, :jobrole, length: { minimum: 5, maximum: 150 }
  validates :story, length: { minimum: 150, maxium: 360 }
end
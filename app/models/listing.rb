class Listing < ActiveRecord::Base
	has_many :stories
	is_impressionable

  validates :fullname, :jobtitle, :email, :franchisename, :leadrecepient, :longdescription,
            :website, :branchcount, :mininvestment, :category, presence: true
  validates :franchisename, :website, uniqueness: true
  validates :fullname, :jobtitle, :email, :franchisename, :leadrecepient, :website, length: { minimum: 5, maximum: 80 }
  validates :branchcount, numericality: { only_integer: true }

	searchable do
    text :franchisename, :boost => 7
    text :longdescription, :boost => 2
    text :category
	end

end

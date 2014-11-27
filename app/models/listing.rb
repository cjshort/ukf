require 'elasticsearch/model'
class Listing < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

	has_many :stories
	is_impressionable

  validates :fullname, :jobtitle, :email, :franchisename, :leadrecepient, :longdescription,
            :website, :branchcount, :mininvestment, :category, presence: true
  validates :franchisename, :website, uniqueness: true
  validates :fullname, :jobtitle, :email, :franchisename, :leadrecepient, :website, length: { minimum: 5, maximum: 80 }
  validates :branchcount, numericality: { only_integer: true }

end

def self.search(query)
  __elasticsearch__.search(
    {
      query: {
        multi_match: {
          query: query,
          fields: ['franchisename^10', 'longdescription']
        }
      }
    }
  )
end

Listing.import # for auto sync model with elastic search

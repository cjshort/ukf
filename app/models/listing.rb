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

end

# Delete the previous articles index in Elasticsearch
Listing.__elasticsearch__.client.indices.delete index: Listing.index_name rescue nil
 
# Create the new index with the new mapping
Listing.__elasticsearch__.client.indices.create \
  index: Listing.index_name,
  body: { settings: Listing.settings.to_hash, mappings: Listing.mappings.to_hash }
 
# Index all article records from the DB to Elasticsearch
Listing.import

class Event < ActiveRecord::Base
  validates :eventname, :startdate, :enddate, :shortdescription, :region, :postcode, :website, presence: true
  validates :shortdescription, length: { minimum: 100, maximum: 500}
  validates :eventname, :startdate, :enddate, :region, :postode, :website, length: { minimum: 3, maximum: 80 }
end
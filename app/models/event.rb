class Event < ActiveRecord::Base
  extend FriendlyId
  friendly_id :eventname, use: :slugged
end
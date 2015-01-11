class Post < ActiveRecord::Base

  extend FriendlyId
  friendly_id :title, use: :slugged

	is_impressionable

end
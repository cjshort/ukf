class Post < ActiveRecord::Base

  extend FriendlyId
  friendly_id :title, use: :slugged

	is_impressionable
	
	validates_acceptance_of :toc, :on => :create, :accept => true
  validates :name, :title, :content, :website, presence: true
  validates :title, uniqueness: true
  validates :name, :title, :website, length: { minimum: 5, maximum: 400 }
  validates :content, length: { minimum: 500, maximum: 10000 }
end
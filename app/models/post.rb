class Post < ActiveRecord::Base
  validates :name, :title, :content, :website, presence: true
  validates :title, uniqueness: true
  validates :name, :title, :website, length: { minimum: 5, maximum: 400 }
end
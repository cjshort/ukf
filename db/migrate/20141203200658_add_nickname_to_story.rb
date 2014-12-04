class AddNicknameToStory < ActiveRecord::Migration
  def change
    add_column :stories, :nickname, :string
  end
end

class AddNicknameToEvent < ActiveRecord::Migration
  def change
    add_column :events, :nickname, :string
  end
end

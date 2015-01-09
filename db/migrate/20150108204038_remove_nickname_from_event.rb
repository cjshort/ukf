class RemoveNicknameFromEvent < ActiveRecord::Migration
  def change
    remove_column :events, :nickname, :string
    remove_column :events, :toc, :integer
  end
end

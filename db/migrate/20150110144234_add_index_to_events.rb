class AddIndexToEvents < ActiveRecord::Migration
  def change
    add_index :events, :slug
  end
end

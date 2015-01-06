class AddIdToListing < ActiveRecord::Migration
  def change
    add_column :listings, :franchise_id, :integer
  end
end

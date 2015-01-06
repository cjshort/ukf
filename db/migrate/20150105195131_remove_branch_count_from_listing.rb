class RemoveBranchCountFromListing < ActiveRecord::Migration
  def change
    remove_column :listings, :branchcount, :string
  end
end

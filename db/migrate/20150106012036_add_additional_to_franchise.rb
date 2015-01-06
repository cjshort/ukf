class AddAdditionalToFranchise < ActiveRecord::Migration
  def change
    add_column :franchises, :fullname, :string
    add_column :franchises, :jobtitle, :string
  end
end

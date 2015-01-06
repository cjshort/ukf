class RemoveDataFromLeads < ActiveRecord::Migration
  def change
    remove_column :leads, :address, :string
    remove_column :leads, :city, :string
    remove_column :leads, :region, :string
    remove_column :leads, :postcode, :string
    remove_column :leads, :contactpreferal, :string
    remove_column :leads, :nickname, :string
  end
end

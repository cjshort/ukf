class RemovePhoneFromLeads < ActiveRecord::Migration
  def change
    remove_column :leads, :phone, :integer
  end
end

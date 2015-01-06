class AddMethodToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :method, :string
  end
end

class RemoveTocFromLeads < ActiveRecord::Migration
  def change
    remove_column :leads, :toc, :boolean
  end
end

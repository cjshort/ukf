class AddNicknameToLead < ActiveRecord::Migration
  def change
    add_column :leads, :nickname, :string
  end
end

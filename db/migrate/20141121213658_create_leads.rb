class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :fullname
      t.string :email
      t.integer :phone
      t.string :address
      t.string :city
      t.string :region
      t.string :postcode
      t.string :country
      t.string :contactpreferal
      t.boolean :toc, default: false

      t.timestamps
    end
  end
end

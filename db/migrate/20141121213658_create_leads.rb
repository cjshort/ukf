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
      t.string :contactpreferal
      t.integer :listing_id
      t.boolean :toc, default: false

      t.timestamps
    end
  end
end

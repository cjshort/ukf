class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :eventname
      t.string :startdate
      t.string :enddate
      t.text :shortdescription
      t.string :region
      t.string :postcode
      t.string :website
      t.boolean :approved, default: false
      t.boolean :toc, default: false

      t.timestamps
    end
  end
end

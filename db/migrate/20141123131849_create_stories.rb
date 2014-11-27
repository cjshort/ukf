class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :fullname
      t.string :email
      t.string :jobrole
      t.text :story
      t.boolean :approved, default: false
      t.boolean :toc, default: false
      t.integer :listing_id

      t.timestamps
    end
  end
end

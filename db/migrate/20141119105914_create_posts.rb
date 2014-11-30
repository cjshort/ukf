class CreatePosts < ActiveRecord::Migration

  def change
    create_table :posts do |t|
      t.string :image
      t.string :title
      t.text :content
      t.string :name
      t.string :website
      t.boolean :approved, default: false
      t.boolean :toc, default: false

      t.timestamps
    end
  end
end

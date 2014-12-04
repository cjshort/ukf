class AddTocToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :toc, :boolean, default: false 
  end
end

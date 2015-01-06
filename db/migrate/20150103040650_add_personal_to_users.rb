class AddPersonalToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :fullname, :string
  	add_column :users, :phone, :string
  	add_column :users, :method, :string
  end
end
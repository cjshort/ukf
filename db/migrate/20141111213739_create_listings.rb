class CreateListings < ActiveRecord::Migration
  
  def change
    create_table :listings do |t|
      t.string :fullname
      t.string :jobtitle
      t.string :email
      t.string :franchisename
      t.string :leadrecepient
      t.text :longdescription
      t.string :website
      t.integer :branchcount
      t.string :scale
      t.string :mininvestment
      t.string :investmentrange
      t.string :category
      t.string :hexbg
      t.string :logourl
      t.string :facebook
      t.string :twitter
      t.string :googleplus
      t.string :linkedin
      t.boolean :spotlight, default: false
      t.boolean :topfranchise, default: false
      t.boolean :approved, default: false
      t.boolean :toc, default: false
      t.timestamps
    end
  end
end

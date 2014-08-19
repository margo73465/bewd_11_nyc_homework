class AddLodgingColumns < ActiveRecord::Migration
  def change
  	add_column :lodgings, :name, :string
  	add_column :lodgings, :dist_from_trail, :string
  	add_column :lodgings, :address, :string
  	add_column :lodgings, :phone, :string
  	add_column :lodgings, :notes, :string
  end
end

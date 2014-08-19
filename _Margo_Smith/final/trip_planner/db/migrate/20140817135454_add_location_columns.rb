class AddLocationColumns < ActiveRecord::Migration
  def change
  	add_column :locations, :name, :string
  	add_column :locations, :trail, :string
  	add_column :locations, :mile_marker, :float
  	add_column :locations, :dist_from_DC, :float
  	add_column :locations, :dist_from_trail, :string
  	add_column :locations, :type, :string
  	add_column :locations, :state, :string
  	add_column :locations, :restaurant, :boolean
  	add_column :locations, :grocery, :boolean
  	add_column :locations, :snacks, :boolean
  	add_column :locations, :notes, :string
  end
end

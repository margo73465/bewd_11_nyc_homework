class AddCampsiteColumns < ActiveRecord::Migration
  def change
  	add_column :campsites, :name, :string
  	add_column :campsites, :dist_from_trail, :string
  	add_column :campsites, :type, :string
  	add_column :campsites, :phone, :string
  	add_column :campsites, :shower, :boolean
  	add_column :campsites, :toilet, :boolean
  	add_column :campsites, :electricity, :boolean
  end
end

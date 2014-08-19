class AddBikeshopColumns < ActiveRecord::Migration
  def change
  	add_column :bikeshops, :name, :string
  	add_column :bikeshops, :address, :string
  	add_column :bikeshops, :phone, :string
  	add_column :bikeshops, :bike_rental, :boolean
  	add_column :bikeshops, :website, :string
  end
end

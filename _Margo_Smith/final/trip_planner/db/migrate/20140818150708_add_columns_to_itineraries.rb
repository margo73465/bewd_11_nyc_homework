class AddColumnsToItineraries < ActiveRecord::Migration
  def change
  	add_column :itineraries, :start, :string
  	add_column :itineraries, :end, :string
  end
end

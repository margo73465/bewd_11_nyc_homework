class ChangeItineraryColumnNames < ActiveRecord::Migration
  def change
  	rename_column :itineraries, :start, :start_location
  	rename_column :itineraries, :end, :end_location
  end
end

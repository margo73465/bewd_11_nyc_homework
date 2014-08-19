class ChangeTypeColumns < ActiveRecord::Migration
  def change
  	rename_column :locations, :type, :location_type
  	rename_column :campsites, :type, :campsite_type
  	rename_column :itineraries, :type, :itinerary_type
  end
end

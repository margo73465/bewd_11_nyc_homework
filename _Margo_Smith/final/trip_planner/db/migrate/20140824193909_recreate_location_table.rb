class RecreateLocationTable < ActiveRecord::Migration
  def change
  	create_table :locations do |t|
	    t.string   :name
	    t.string   :trail
	    t.float    :mile_marker
	    t.float    :dist_from_DC
	    t.string   :dist_from_trail
	    t.string   :location_type
	    t.string   :state
	    t.boolean  :restaurant
	    t.boolean  :grocery
	    t.boolean  :snack
	    t.string   :notes
	    t.float :latitude
	    t.float :longitude 
	  end

  end
end

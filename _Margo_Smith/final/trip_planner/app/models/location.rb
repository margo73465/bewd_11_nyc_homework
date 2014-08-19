class Location < ActiveRecord::Base
	has_many :lodgings
	has_many :campsites
	has_many :bikeshops
	has_and_belongs_to_many :itineraries

	def self.find_in_range(min, max, type)
		locations = Location.where('dist_from_DC >= :min AND dist_from_DC <= :max', min: min, max: max)
		
		locations.each do |location|
			if (type == "campsite" && !location.campsites.empty?) || 
				(type == "hotel" && !location.lodgings.empty?)
				return location
			end
		end
		
		return nil
	end

end

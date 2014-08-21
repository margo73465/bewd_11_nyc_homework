class Itinerary < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :locations

  def add_locations
		@start_location = Location.find_by(id: start_location.to_i)
		@end_location = Location.find_by(id: end_location.to_i)
		@nights = nights.to_i
		@type = itinerary_type

		start_miles = @start_location.dist_from_DC
		end_miles = @end_location.dist_from_DC
		total_miles = end_miles - start_miles
		miles_per_day = total_miles/(nights + 1)

		locations << @start_location

		current_location = start_miles
			
		nights.times do 
			ideal_stop = current_location + miles_per_day
			
			stop = nil
			i = 1
			while stop == nil
				stop = Location.find_in_range(ideal_stop - i, ideal_stop + i, @type)
				i += 1
			end

			locations << stop
			current_location = stop.dist_from_DC

		end

		locations << @end_location
  end
end

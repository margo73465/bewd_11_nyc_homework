class ItinerariesController < ApplicationController
	before_action :authenticate_user!

	def index
		#@itinerary = Itinerary.last
		#@itinerary.user_id = current_user.id
	end

	def show
		load_itinerary
	end

	def new
		@itinerary = Itinerary.new
	end

	def create
		@i = Itinerary.new(safe_itineray_params)

		start_location = Location.find_by(id: @i.start.to_i)
		end_location = Location.find_by(id: @i.end.to_i)
		nights = @i.nights.to_i
		type = @i.itinerary_type

		start_miles = start_location.dist_from_DC
		end_miles = end_location.dist_from_DC
		total_miles = end_miles - start_miles
		miles_per_day = total_miles/(nights + 1)

		@i.locations << start_location

		current_location = start_miles
			
		nights.times do 
			ideal_stop = current_location + miles_per_day
			

			stop = nil
			i = 1
			while stop == nil
				stop = Location.find_in_range(ideal_stop - i, ideal_stop + i, type)
				i += 1
			end

			@i.locations << stop
			current_location = stop.dist_from_DC

		end

		@i.locations << end_location

		if user_signed_in?
			@i.user_id = current_user.id
		end

		if @i.save
      redirect_to itinerary_path(@i)
    else
      render 'new'
    end
	end

	def edit
		load_itinerary
	end

	def update
		load_itinerary

	end

=begin
	def save(itinerary)
		if user_logged_in?
			itinerary.user_id = current_user.id
		end

		if itinerary.save
      redirect_to itinerary_path(itinerary)
    else
      render 'new'
    end
	end
=end

	private
	def load_itinerary
		@itinerary = Itinerary.find_by(id: params[:id])
		#@itinerary = Itinerary.find_by(name: params[:itinerary][:name])
	end

	def safe_itineray_params
		params.require(:itinerary).permit(:name, :start, :end, :itinerary_type, :nights)
	end

end

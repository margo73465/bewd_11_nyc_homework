class ItinerariesController < ApplicationController
	before_action :authenticate_user!

	def index
		#@itinerary = Itinerary.last
		#@itinerary.user_id = current_user.id
	end

	def show
		load_itinerary

		@hash = Gmaps4rails.build_markers(@itinerary.locations) do |location, marker|
		  marker.lat location.latitude
		  marker.lng location.longitude
		end
	end

	def new
		@itinerary = Itinerary.new
	end

	def create
		@itinerary = Itinerary.new(safe_itineray_params)

		@itinerary.add_locations

		if user_signed_in?
			@itinerary.user_id = current_user.id
		end

		if @itinerary.save
      redirect_to itinerary_path(@itinerary)
    else
      render 'new'
    end
	end

	def edit
		load_itinerary
	end

	def update
		load_itinerary
		@itinerary.update!(safe_itineray_params)

		@itinerary.locations = []
		@locations = @itinerary.add_locations

		
		# binding.pry
		@itinerary.save

		redirect_to itinerary_path(@itinerary)
	end

	def destroy
		Itinerary.destroy(params[:id])
		redirect_to itineraries_path
	end

	private
	def load_itinerary
		@itinerary = Itinerary.find_by(id: params[:id])
		#@itinerary = Itinerary.find_by(name: params[:itinerary][:name])
	end

	def safe_itineray_params
		params.require(:itinerary).permit(:name, :start_location, :end_location, :itinerary_type, :nights)
	end

end

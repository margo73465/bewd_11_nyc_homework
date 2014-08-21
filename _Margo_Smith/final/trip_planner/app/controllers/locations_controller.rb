class LocationsController < ApplicationController
	def show
		load_location
	end

	private
	def load_location
		@location = Location.find_by(id: params[:id])
	end

end

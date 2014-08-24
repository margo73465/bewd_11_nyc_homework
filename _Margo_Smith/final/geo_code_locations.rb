
require 'json'
require 'rest-client'
require 'uri'

API_KEY = 'AIzaSyAM78t8GZhM10qpaRTbOZBjdNwdDiw_W98'
bounds = '40.4406248,-79.9958864|38.9071923,-77.0368707'

locations = ["Pittsburgh", "Homestead", "Hazelwood", "McKeesport", "Boston", "Greenock", "Dravo's Landing Camping", "Buena Vista", "Sutersville", "West Newton", "Cedar Creek Park", "Smithton", "Cedar Creek Hiker Biker", "Belle Vernon", "Perryopolis", "Layton", "Round Bottom Hiker Biker", "Dawson/Dickerson Run", "Dawson", "Adelaide", "Rivers Edge Campground", "Connellsville", "Dunbar", "Ohiopyle", "Confluence", "Harnedsville", "Fort Hill", "Markleton", "Rockwood", "Garrett", "Meyersdale", "Mason-Dixon Campground", "Frostburg", "Mt Savage", "Cumberland", "Evitts Creek Hiker-Biker", "Iron Mountain Hiker-Biker", "Spring Gap Drive-in Camp", "Pigmans Ferry Hiker-Biker", "Oldtown", "Potomac Forks Hiker-Biker", "Town Creek Hiker-Biker", "Purslane Run Hiker-Biker", "Paw Paw Walk-in Camp", "Paw Paw", "Sorrel Ridge Hiker-Biker", "Stickpile Hill Hiker-Biker", "Devils Alley Hiker-Biker", "Little Orleans", "Indigo Neck Hiker-Biker", "Cacapon Junction Hiker-Biker", "Leopards Mill Hiker-Biker", "White Rock Hiker-Biker", "Hancock", "Little Pool Hiker-Biker", "Licking Creek Hiker-Biker", "Big Pool", "McCoy's Ferry", "North Mountain Hiker-Biker", "Dam 5 Road", "Jordan Junction Hiker-Biker", "Williamsport", "Cumberland Valley Hiker-Biker", "Opequon Junction Hiker-Biker", "McMahon's Mill Campground", "Big Woods Hiker-Biker", "Horseshoe Bend Hiker-Biker", "Killiansburg Cave Hiker-Biker", "Shepherdstown", "Sharpsburg", "Antietam Walk-in Camp", "Huckleberry Hill Hiker-Biker", "Sandy Hook", "Harpers Ferry", "Knoxville", "Harper's Ferry", "Brunswick", "Brunswick Family Campground", "Bald Eagle Island Hiker-Biker", "Lock House 28", "Point of Rocks", "Calico Rocks Hiker-Biker", "Indian Flats Hiker-Biker", "Dickerson", "Marble Quarry Hiker-Biker", "Whites Ferry", "Turtle Run Hiker-Biker", "Chisel Branch Hiker-Biker", "Horsepen Branch Hiker-Biker", "Lock House 22", "Swains Lock Hiker-Biker", "Great Falls", "Marsden Tract Group Camp", "Lock House 10", "Lock House 6", "Fletcher's Boat House", "Georgetown", "DC"]

locations.each do |location|

	location_array = location.split
	s = ""
	location_array.each do |word|
		s = s + word
		unless word == location_array.last
			s = s + "+"
		end
	end

	#url = 'https://maps.googleapis.com/maps/api/geocode/json?address=' + s + '&bounds=' + bounds + '&key=' + API_KEY
	component = 'DC'
	url = 'https://maps.googleapis.com/maps/api/geocode/json?address=' + s + '&components=country:US|administrative_area:' + component + '&key=' + API_KEY
	encoded_url = URI.encode(url)
	URI.parse(encoded_url)

	geo_client = RestClient.get(encoded_url)
	geo_data = JSON.load(geo_client)

	if geo_data["status"] == "OK"
		latitude = geo_data["results"][0]["geometry"]["location"]["lat"]
		longitude = geo_data["results"][0]["geometry"]["location"]["lng"]
		formatted_address = geo_data["results"][0]["formatted_address"]

		puts formatted_address + " " + latitude.to_s + " " + longitude.to_s
	end

end
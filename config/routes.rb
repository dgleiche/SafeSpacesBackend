Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # INPUT FORMAT:
  # {
  #   google_place_id: Integer (required)
  # }
  # RETURNS:
  # {
  #   location: JSON object representing location data
  #   information: JSON object representing accessibility information data
  # }
  post 'location/get' => 'location#location_info'


  # INPUT FORMAT:
  # {location:
  #   location_type_name: String
  #   name: String
  #   address: String
  #   city: String
  #   state: String
  #   zip: String
  #   lat: Float
  #   long: Float
  #   google_place_id: Integer
  #   location_type_id: Integer (replaced if location_type_name is specified)
  # }
  # RETURNS:
  # JSON object representing inputted location
  post 'location/add_location' => 'location#add_location'

  # INPUT FORMAT:
  # {location:
  #   id: Integer (REQUIRED)
  #   location_type_name: String
  #   name: String
  #   address: String
  #   city: String
  #   state: String
  #   zip: String
  #   lat: Float
  #   long: Float
  #   google_place_id: Integer
  #   location_type_id: Integer (replaced if location_type_name is specified)
  # }
  # RETURNS:
  # JSON object representing updated location
  post 'location/update_location' => 'location#update_location'

  # INPUT FORMAT:
  # {accessibility_information:
  #   google_place_id: Integer
  #   location_id: Integer (replaced if google_place_id is specified)
  #   description: String
  #   gen_accessible: Bool
  #   smooth: Bool
  #   elevators: Bool
  #   ramps: Bool
  #   sound: Bool
  #   sound_measure: Float
  #   brail: Bool
  #   sight_impaired: Bool
  #   bathrooms: Bool
  #   automatic_doors: Bool
  #   parking: Bool
  #   photos: String[] (array of URLs)
  #   door_widths: Float[] (array of door widths)
  #   table_heights: Float[] (array of table heights)
  #   score: Float (average of the bools)
  # }
  # RETURNS:
  # JSON object representing inputted accessibility information
  post 'location/add_information' => 'location#add_accessesibility_information'

  # INPUT FORMAT:
  # {accessibility_information:
  #   id: Integer (REQUIRED)
  #   google_place_id: Integer
  #   location_id: Integer (replaced if google_place_id is specified)
  #   description: String
  #   gen_accessible: Bool
  #   smooth: Bool
  #   elevators: Bool
  #   ramps: Bool
  #   sound: Bool
  #   sound_measure: Float
  #   brail: Bool
  #   sight_impaired: Bool
  #   bathrooms: Bool
  #   automatic_doors: Bool
  #   parking: Bool
  #   photos: String[] (array of URLs)
  #   door_widths: Float[] (array of door widths)
  #   table_heights: Float[] (array of table heights)
  #   score: Float (average of the bools)
  # }
  # RETURNS:
  # JSON object representing updated accessibility information
  post 'location/update_information' => 'location#update_accessibility_information'

end

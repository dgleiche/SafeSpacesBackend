class LocationController < ApplicationController

  def location_info
    google_place_id = params[:google_place_id]
    location = Location.find_by(google_place_id: google_place_id)
    accessibility_informations = AccessibilityInformation.where(location: location)

    render json: [location: location.to_json, information: accessibility_informations.to_json].to_json
  end

  def add_location
    location = Location.create(location_params)

    render json: location.to_json
  end

  def update_location
    location_id = params[:location][:id]
    location = Location.find(location_id)

    location.update(location_params)

    render json: location.to_json
  end

  def add_accessibility_information
    information = AccessibilityInformation.create(accessibility_information_params)

    render json: information.to_json
  end

  def update_accessibility_information
    information_id = params[:accessibility_information][:id]
    information = AccessibilityInformation.find(information_id)

    information.update(accessibility_information_params)

    render json: information.to_json
  end

  def location_params
    location_type_name = params[:location][:location_type_name]
    unless location_type_name.nil?
      location_type = LocationType.find_or_create_by(name: location_type_name)
      params[:location][:location_type_id] = location_type.id
    end

    params.require(:location).permit(:name, :address, :city, :state, :zip, :lat, :long, :google_place_id, :location_type_id)
  end

  def accessibility_information_params
    google_place_id = params[:accessibility_information][:google_place_id]
    unless google_place_id.nil?
      location = Location.find_by(google_place_id: google_place_id)
      params[:accessibility_information][:location_id] = location.id
    end

    params.require(:accessibility_information).permit(:description, :gen_accessible, :smooth, :elevators, :ramps, :sound,
                                                      :sound_measure, :brail, :sight_impaired, :bathrooms, :automatic_doors,
                                                      :parking, :photos, :door_widths, :table_heights, :location_id, :score)
  end

end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'csv'

def upload_location_type()
  filename = 'db/location_type.csv'
  park = nil
  CSV.foreach(filename, :headers => true) do |row|
    name = row[0]
    location_type = LocationType.create(name: row[0])
    park = location_type if name == 'park'
  end

  park
end

def upload_location(default_location)
  filename = 'db/npr.csv'

  CSV.foreach(filename, :headers => true) do |row|
    name = row[0]
    address = row[1]
    city = row[2]
    state = row[3]
    zip = row[4]
    lat = row[5].to_f
    long = row[6].to_f

    location = Location.create(name: name, address: address, city: city, state: state, zip: zip, lat: lat, long: long,
                               location_type: default_location)

    description = row[7]
    gen_accessible = row[8] == 'True' ? 1 : 0
    smooth = row[9] == 'True' ? 1 : 0
    elevators = row[10] == 'True' ? 1 : 0
    ramps = row[11] == 'True' ? 1 : 0
    sound = row[12] == 'True' ? 1 : 0
    brail = row[13] == 'True' ? 1 : 0
    sight_impaired = row[14] == 'True' ? 1 : 0
    bathrooms = row[15] == 'True' ? 1 : 0
    automatic_doors = 1

    score = (gen_accessible + smooth + elevators + ramps + sound + brail + sight_impaired + bathrooms + automatic_doors) / 9.0

    AccessibilityInformation.create(location: location, description: description, gen_accessible: gen_accessible,
                                    smooth: smooth, elevators: elevators, ramps: ramps, sound: sound, brail: brail,
                                    sight_impaired: sight_impaired, bathrooms: bathrooms, automatic_doors: automatic_doors,
                                    score: score)
  end
end

park = upload_location_type
upload_location(park)
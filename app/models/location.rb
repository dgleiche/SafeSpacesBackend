class Location < ApplicationRecord
  belongs_to :location_type
  has_many :accessibility_informations
end

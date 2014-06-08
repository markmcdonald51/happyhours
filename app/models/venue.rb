class Venue < ActiveRecord::Base
  #has_one :location, as: :locatable
  #acts_as_mappable through: :location
  #accepts_nested_attributes_for :location
    
  acts_as_taggable_on :features
 
  validates :name, presence: true


  geocoded_by :full_street_address, latitude: :lat, longitude: :lng  do |obj,results|
    if geo = results.first
      obj.lat = geo.latitude
      obj.lng = geo.longitude
      obj.full_street_address = geo.address
    end
  end  

 
end

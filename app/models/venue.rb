class Venue < ActiveRecord::Base
  #include ArelHelpers::ArelTable # https://github.com/camertron/arel-helpers

  include AASM
  acts_as_taggable_on :features
  validates :name, presence: true

=begin
 aasm do
      state :brand_new, :initial => true
      state :updated_profile
      state :trusted
      state :banned
      state :removed

      event :profile_updated do
        transitions :from => [:brand_new,:updated_profile], :to => :updated_profile
      end
  end
=end

  geocoded_by :full_street_address, latitude: :lat, longitude: :lng  do |obj,results|
    if geo = results.first
      obj.lat = geo.latitude
      obj.lng = geo.longitude
      obj.full_street_address = geo.address
    end
  end  

 
end

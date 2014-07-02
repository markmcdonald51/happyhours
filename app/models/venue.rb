class Venue < ActiveRecord::Base
  #include ArelHelpers::ArelTable # https://github.com/camertron/arel-helpers

  acts_as_taggable_on :features
  validates :name, presence: true
  after_validation :geocode, if: ->(obj){ obj.full_street_address.present? and 
    obj.full_street_address_changed? }
    
  has_many :events
  has_many :occurences, through: :events
  
  #delegate :started_at, :expired_at, to: :occurences
    
  scope :open, -> { includes(:occurences).joins(:occurences).where("occurences.started_at < ? 
                  and occurences.expired_at > ?", Time.now, Time.now) }
  
  scope :happy_hour_now, -> { where("happy_hours != ''") }

  scope :priced_economical, -> { where('length(price) = 1') }
  scope :priced_moderate,   -> { where('length(price) = 2') }
  scope :pricy,             -> { where('length(price) = 3') }
  scope :expensive,         -> { where('length(price) = 4') }
  
  
=begin
  include AASM

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

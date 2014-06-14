class User < ActiveRecord::Base
  include AASM

  geocoded_by :postal_code, latitude: :lat, longitude: :lng  do |obj,results|
    if geo = results.first
      obj.lat = geo.latitude
      obj.lng = geo.longitude
      obj.postal_code = geo.address
    end
  end  
  after_validation :geocode, if: ->(obj){ obj.postal_code.present? and obj.postal_code_changed? }
  
  # validations
  validates :provider, :uid, :name, :oauth_token, :image_url, presence: true
  
  #acts_as_mappable
  #before_validation :geocode_address, on: :update
  
  # this validations are checked when updating user because can be nil when we authenticate through twitter
  validates :email, uniqueness: true, presence: true, 
    format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]+\z/i }, :on => :update
  validates :first_name, presence: true, on: :update
  validates :last_name, presence: true, on: :update
  validates :gender, presence: true, on: :update
  

  aasm do
      state :brand_new, :initial => true
      state :updated_profile
      state :trusted
      state :banned
      state :removed

      event :profile_updated do
        transitions :from => [:brand_new,:updated_profile], :to => :updated_profile
      end

      event :trust do
        transitions :from => [:updated_profile, :banned, :removed], :to => :trusted
      end

      event :banned do
        transitions :from => [:running, :cleaning], :to => :sleeping
      end
  end



  
  def self.from_omniauth(auth)
    find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
  end
  

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"] # nil when provider = twitter
      user.first_name = auth["info"]["first_name"] # nil when provider = twitter
      user.last_name = auth["info"]["last_name"] # nil when provider = twitter
      user.gender = auth["extra"]["raw_info"]["gender"] # nil when provider = twitter
      user.image_url = auth["info"]["image"]
      user.oauth_token = auth["credentials"]["token"]
    end
  end
    
  private
    def geocode_address
      [postal_code, country_code].compact.join(', ')  
    end
=begin    
      unless country_code.blank? && postal_code.blank?
        loc = "#{country_code}, #{postal_code}"
        geo=Geokit::Geocoders::MultiGeocoder.geocode(loc)
        errors.add(:postal_code, "Could not Geocode address") if !geo.success
        if geo.success
          self.lat, self.lng = geo.lat,geo.lng 
          #self.country_code = geo.country_code
        end  
      else
        self.lat = nil 
        self.lng = nil   
      end  
    end
=end

end

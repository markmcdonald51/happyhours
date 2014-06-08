class Location < ActiveRecord::Base
  #include AASM
  
  belongs_to :locatable, polymorphic: true  
  geocoded_by :full_street_address, latitude: :lat, longitude: :lng  do |obj,results|
    if geo = results.first
      obj.lat = geo.latitude
      obj.lng = geo.longitude
      obj.full_street_address = geo.address
    end
  end  
     
  after_validation :geocode 
  
  
  def self.filtered_by type
    belongs_to type, :foreign_key => :located_id, :foreign_type => type.to_s.capitalize
    where(:located_type => type.to_s.capitalize).joins(type).includes(:located)
  end
  
end


  
=begin  
  validates_presence_of :address_one, :postal_code, 
    unless: Proc.new { |user| user.address_string.present? }
    
  validate :validiate_location
   #, unless: Proc.new{|addr|   addr.address_one.blank? || addr.postal_code.blank?}
  
  attr_accessor :address_string
    
  acts_as_mappable :default_units       => :miles,
                   :default_formula     => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name     => :lat,
                   :lng_column_name     => :lng
                                      
  def validiate_location
    @address_string ||= [:address_one, :postal_code].map{|f| self.send(f)}.join(',')
    
    res = Geokit::Geocoders::GoogleGeocoder.geocode(@address_string)
   
    if (res.success && [:address, :building].include?(res.precision.to_sym))

      self.address_one  = res.street_address
      self.postal_code  = res.zip.gsub(/\s+/,'')
      self.city         = res.city
      self.region       = res.state
      self.country      = res.country_code
      
      self.precision    = res.precision
      self.provider     = res.provider
      
      self.lat          = res.lat
      self.lng          = res.lng 
      
     return true
    elsif military_address?
      return true
    else
      self.errors.add :base, 'Sorry the address is not valid'
    end
  end

  def military_address?
    return false if region.blank? || city.blank? || postal_code.blank?
    
    (%w(ae aa ap).include?(region.try(:downcase)) and
            postal_code =~ /^0/ and
            %w(apo fpo).include?(city.downcase))
  end
=end


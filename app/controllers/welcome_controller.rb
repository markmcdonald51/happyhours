class WelcomeController < ApplicationController
  def index
  
    unless current_user    
      @ip_location = Geocoder.search request.remote_ip
      
        # if there isnt a current user then do something like
 # 2.1.1 :004 > Geocoder.search '75.175.49.34'
 #=> [#<Geocoder::Result::Freegeoip:0x0000000748e0c0 @data={"ip"=>"75.175.49.34", "country_code"=>"US", #"country_name"=>"United States", "region_code"=>"OR", "region_name"=>"Oregon", "city"=>"Portland", "zipcode"=>"", # "latitude"=>45.5234, "longitude"=>-122.6762, "metro_code"=>"820", "area_code"=>"503"}, @cache_hit=nil>] 


    end  
    
  end
end

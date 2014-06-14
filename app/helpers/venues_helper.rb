module VenuesHelper
  include ActsAsTaggableOn::TagsHelper


  def distance_from_user
    if current_user
      "#{@venue.distance_from(current_user).round(2)} miles away from your #{link_to('profile location', profile_path)}" 
    end   
  end
  
  def large_image 
    if @venue.big_image_link
      image_tag "http://www.portlandmercury.com#{@venue.big_image_link}", class: 'img-rounded'   
    end
  end
    
  def thumbnail
    if @venue.sm_image_link
      image_tag "http://www.portlandmercury.com#{@venue.big_image_link}", class: 'thumbnail' 
    end    
  end

end

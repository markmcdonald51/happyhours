namespace :fetch do
    desc "get_restaurants"
    task :fetch_restaurants => :environment do
      puts "Fetching Restaurants:"
      
      require 'nokogiri'
      require 'open-uri'
      # Get a Nokogiri::HTML::Document for the page we’re interested in...

      url = 'http://www.portlandmercury.com/portland/LocationSearch?locationSection=933057&page='
     
      (5..154).each do |page_id|   
        doc = Nokogiri::HTML(open("#{url}#{page_id}"))

        doc.search('.locationListing').each do |link|
          #puts link.content
          
          name  = link.search('li.locationItem h4 a').map(&:text).last
          b_link  = link.search('li.locationItem h4 a').last['href']        
          b_website   = link.search('.url a').text
          b_email = link.search('.email a').text
          phone = link.search('.locationPhone').text
          price = link.search('.diningPriceKey').text
          description = link.search('.descripTxt').text.gsub(/\s+/, ' ')
          address = link.search('li.l1').first.text.gsub(/\s+/, ' ').remove('(map)')
          tags = link.search('.tags a').map(&:text)
          sm_image_link = link.search('img.locationListingImg').first['src'] rescue nil

          
          puts "NAME:  #{name}"
          puts "LINK: #{b_link}"
          puts "PHONE: #{phone}"
          puts "website: #{b_website}"
          puts "EMAIL: #{b_email}"
          
          puts "Price: #{price}"
          puts "ADDRESS: #{address}"
          puts "DESC:  #{description}"
          puts "TAGS: #{tags.to_s}"
          puts "IMAGE LINK: #{sm_image_link}"
          
         
          v = Venue.new(name: name, r_link: b_link, phone: phone, price: price,
            description: description, website: b_website, email: b_email, sm_image_link: sm_image_link)
          
          v.build_location(full_street_address: address + " , oregon")
          
          v.feature_list = tags.to_s
          
          
          puts "-------------------------"
                  
          # HAPPY HOURS
         # <strong>
          #<span class="DiningHappyHourInfo">Happy Hour Info:</span>
          #</strong>
          #Daily 3pm-6pm
          #<br>
          #Sun-Thurs 10pm-12am
          #<br>
          #$.75 off draft beers, $4 wells, $4.75 fresh fruit margaritas, food menu from #$2-5.
          
          # Get happy hour info:
          bar_doc = Nokogiri::HTML(open(b_link))
          h = bar_doc.search('#LocationRestaurantDetails p').last.text rescue nil
          
          v.big_image_link = bar_doc.search('.zoomable').first[:href]  rescue nil
        
          hours = bar_doc.search('#LocationMetaData').last.text.gsub(/\s+/, ' ').match(/Hours:(.*)/)[1] rescue nil
          v.hours = hours
          puts "Big Image #{v.big_image_link}"
          puts "HOURS: #{hours}"
          if h
            happy_hours = h.match(/Happy Hour Info:(.*)/)
            v.happy_hours = happy_hours[1] rescue nil
            v.save
          end  
          
          puts '*****************************'
          puts '      HAPPY HOURS     '
          puts "#{happy_hours}"
          
          #sleep (2)
          
          #bar_doc.search('#LocationRestaurantDetails p').last.text
          #"Price: $$Happy Hour Info: Tue-Sun 2:30-5:30pm, 9-11pm (Daily specials)." 

          #<strong>Hours: 
          #Hours: Mon-Fri 11am-2:30am, Sat-Sun 11am-1:30am
          
       
          #schedule.add_recurrence_rule Rule.weekly(2).day(:monday, :tuesday)
          
          
          #Happy Hour Info: 
            # Daily 3pm-6pm $1 off all drafts & wells. Eats $2-7 including small bits, burger, fish & chips, etc
            # Daily 4-6pm (50¢ off beer).
           #     |      
          #schedule.add_recurrence_rule Rule.daily
          
          ### Make searchable
          #
          
          
          end
        
      
      end
      
      
    end
end

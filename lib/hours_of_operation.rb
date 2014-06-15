module HoursOfOperation

  include IceCube
  
  DAYS = ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'] 
  DAYS_FULLNAME= ['monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday']      
  DAYS_PIPE = DAYS.join('|')     
  DAYS_THRU_REGEX_MATCH  = /(#{DAYS_PIPE})\s*\-\s*(#{DAYS_PIPE})/i
  HOURS_THRU_REGEX_MATCH = /([\d\:]+\w+)-([\d\:]+\w+)/i
  
  
       
  def create_schedule_from_string(s)
  
    s.gsub!(/thurs/i, 'thu')
    s.gsub!(/tues/i, 'tue')
    s.gsub!(/&/, ' - ')
    puts '-------------------------'
    puts "Started with #{s}"
    parts = s.split(',')
    parts.each do |p|
   
      puts "Trying #{p}"
      days = get_days(p)
      puts days.to_s
      hours = get_hours(p)
      puts hours.to_s
      #add_to_schedule(p, schedule)
    end
    
    #puts "#{days.first} #{hours.first}"
    #start_date = Chronic.parse("#{days.first} #{hours.first}")
    
    #schedule = Schedule.new(start_date ) 
  end
  
  def get_days(s)
    #case s
    days = []
    if m = s.match(DAYS_THRU_REGEX_MATCH)
      days = DAYS.index(m[1].downcase) .. DAYS.index(m[2].downcase)
    elsif m = s.match(/daily/i)
      days = [0,6]
      
    elsif m = s.match(/(#{DAYS_PIPE})/i) 
      # match a single day 
      return [DAYS_FULLNAME[DAYS.index(m[1].downcase)].to_sym]
    end
    return DAYS_FULLNAME[days.first .. days.last].map(&:to_sym)  unless days.blank?
    
      
  end
  
  def get_hours(s)  
  
    #include 'midnight/midnite'
    if m = s.match(HOURS_THRU_REGEX_MATCH) 
      return m[1,2]
    end
      
  end
  
end      

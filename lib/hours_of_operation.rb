module HoursOfOperation

  include IceCube
  
  DAYS = ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'] 
  DAYS_FULLNAME= ['monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday']      
  DAYS_PIPE = DAYS.join('|')     
  DAYS_THRU_REGEX_MATCH  = /(#{DAYS_PIPE})\s*\-\s*(#{DAYS_PIPE})/i
  HOURS_THRU_REGEX_MATCH = /([\d\:]+\w+)-([\d\:]+\w+)/i
 
 
  REAL_DAYS = ['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat'] 
  REAL_DAYS_FULLNAME= ['sunday','monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday'] 
  
       
  def create_schedule_from_string(s)
    s.gsub!(/thurs/i, 'thu')
    s.gsub!(/tues/i, 'tue')
    s.gsub!(/&/, ' - ')
    puts '-------------------------'
    puts "Started with #{s}"
    parts = s.split(',')
    
    schedules = []
    last_days = []
    parts.each do |p|
   
      puts "Trying #{p}"
      days = get_days(p)
      last_days ||= days
      puts days.to_s
      hours = get_hours(p)
      puts hours.to_s
      #add_to_schedule(p, schedule)

      unless hours.blank?    
        start_time = "Today #{hours.first}"
        puts start_time
        s_time = Chronic.parse(start_time)
        
        if (hours.last =~ /^[1|2|3|4].*am/i)
          e_time = Chronic.parse("Tomorrow #{hours.last}")
        else
          e_time = Chronic.parse("Today #{hours.last}")
        end
         
        puts "Start time #{s_time}    END time #{e_time}"
        schedule = IceCube::Schedule.new(s_time, end_time: e_time+5.years)
        
        if days.blank?
          days = last_days
        else
          last_days = days
        end  
        
        schedule.add_recurrence_rule(IceCube::Rule.weekly.day(days))
        #{:validations=>{:day=>[1, 4, 6]}, :rule_type=>"IceCube::WeeklyRule", :interval=>1, :week_start=>0}
        validation_days = days.map{|v| REAL_DAYS_FULLNAME.index(v.to_s)}
        schedule_hash = {
          :validations=>{:day=>validation_days},
          :rule_type=>"IceCube::WeeklyRule", :interval=>1, :week_start=>0
        } 
        
        schedules << [schedule, schedule_hash, s_time, e_time, p]
      end
    end
    return schedules 
  end
  
  def get_days(s)
    #case s
    days = []
    if m = s.match(DAYS_THRU_REGEX_MATCH)
      days = REAL_DAYS.index(m[1].downcase) .. REAL_DAYS.index(m[2].downcase)
    elsif m = s.match(/daily/i)
      days = [0,6]     
    elsif m = s.match(/(#{DAYS_PIPE})/i)
      return if s =~ /closed/i 
      # match a single day 
      return [REAL_DAYS_FULLNAME[REAL_DAYS.index(m[1].downcase)].to_sym]
    end
    return REAL_DAYS_FULLNAME[days.first .. days.last].map(&:to_sym)  unless days.blank?
  end
  
  def get_hours(s)  
  
    #include 'midnight/midnite'
    if m = s.match(HOURS_THRU_REGEX_MATCH) 
      return m[1,2]
    end
      
  end
  
end      

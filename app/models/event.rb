class Event < ActiveRecord::Base
  #include AASM
  include IceCube
  require 'date'

 # attr_accessible :start_time, :end_time, :schedule, :date
  serialize :schedule, Hash
  #attr_accessible :ice_cube_rule # which returns my deserialized ice_cube object
  belongs_to :venue
  has_many :occurences, dependent: :destroy
 # has_one :location, through: :venue
  
  after_save :create_occurrences
 
  def schedule=(new_schedule) 
    if RecurringSelect.is_valid_rule?(new_schedule)
      write_attribute(:schedule, RecurringSelect.dirty_hash_to_rule(new_schedule).to_hash)
    else
      write_attribute(:schedule, nil)
      self.occurences.destroy_all 
    end
  end

  def converted_schedule
    if RecurringSelect.is_valid_rule?(self.schedule)
      if started_at > Date.today
        the_schedule = Schedule.new(started_at)
      else
        the_schedule = Schedule.new(Date.today)
      end
      the_schedule.add_recurrence_rule(RecurringSelect.dirty_hash_to_rule(self.schedule))
      the_schedule
    else
      the_schedule = IceCube::Schedule.new(started_at, end_time: expired_at)
      the_schedule
    end
  end

  def rule
    if RecurringSelect.is_valid_rule?(self.schedule)
      rule = RecurringSelect.dirty_hash_to_rule(schedule)
      rule.to_s
    else
      return "Eenmalig"
    end
  end

  def first_event
    converted_schedule.first
  end
  
    
  def create_occurrences  
      self.occurences.destroy_all
      converted_schedule.occurrences(Time.new.end_of_month).each do |o|
        # fix the datetime in the newschedule
        t = Time.parse(o.to_s) 
   
        start_at  = Time.mktime(t.year, t.month, t.day, t.hour, t.min)
        expire_at = Time.mktime(t.year, t.month, t.day, expired_at.hour, expired_at.min)        
        self.occurences.create(started_at: start_at, expired_at: expire_at)
      end
  end    
  
  
  
end

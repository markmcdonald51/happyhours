class Escrow < ActiveRecord::Base
  include AASM
  belongs_to :user
  
  validates :seller_email, :buyer_email, presence: true, 
    format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]+\z/i }, :on => :update
 
  aasm do
    state :sent_invitations, :initial => true, :before_enter => :send_emails
    state :sent_payment_invitation   
    state :verify_escrow_and_payment_invitations
    state :collect_bitcoins

    event :run do
      transitions :from => :sleeping, :to => :running
    end

    event :clean do
      transitions :from => :running, :to => :cleaning
    end

    event :sleep do
      transitions :from => [:running, :cleaning], :to => :sleeping
    end
    
    #event :run, :after => Proc.new { do_afterwards } do
    #  transitions :from => :sleeping, :to => :running, :on_transition => Proc.new {|obj, *args| obj.set_process(*args) }
    #end
    
  end
  
  private
    def create_escrow_pair
      x = Array.new(32)
      y = Array.new(32)
      rng = SecureRandom.hex #=> "eb693ec8252cd630102fd0d0fb7c3485"
  
  
    end
    
    def send_invite_email
    
    end
  
end

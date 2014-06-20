class VenuesController < ApplicationController
  ActionView::Helpers::DateHelper 

  before_action :set_venue, only: [:show, :edit, :update, :destroy]
  
  autocomplete :venue, :name, :full => true
  
  # if there isnt a current user then do something like
 # 2.1.1 :004 > Geocoder.search '75.175.49.34'
 #=> [#<Geocoder::Result::Freegeoip:0x0000000748e0c0 @data={"ip"=>"75.175.49.34", "country_code"=>"US", #"country_name"=>"United States", "region_code"=>"OR", "region_name"=>"Oregon", "city"=>"Portland", "zipcode"=>"", # "latitude"=>45.5234, "longitude"=>-122.6762, "metro_code"=>"820", "area_code"=>"503"}, @cache_hit=nil>] 

  

  
  # GET /venues
  # GET /venues.json
  def index
    @tags = Venue.tag_counts_on(:features)
    scope = Venue   
    @distance = params[:distance] || 1

    if params[:search_name]
      scope = scope.where("name like ?", "%#{params[:search_name]}%")
      @distance = 100 
    end
 
    if params[:tag]
      @tag = params[:tag]
      scope = scope.tagged_with(params[:tag])
      @distance = 5
    end
    
    if current_user
      scope = scope.near(current_user, @distance)
    end 
    
    if session[:distance] = params[:open]
      scope = scope.open
    end
    
    if session[:happy_hour] = params[:happy_hour]      
      scope = scope.happy_hour_now
    end
    
    #debugger
    session[:distance] = @distance
    session[:open] = params[:open]
    
    #scope = scope.paginate(:page => params[:page], :per_page => 20)   
    @venues = scope.all       
   
  end

  # GET /venues/1
  # GET /venues/1.json
  def show
  end

  # GET /venues/new
  def new
    @venue = Venue.new
  end

  # GET /venues/1/edit
  def edit
  end

  # POST /venues
  # POST /venues.json
  def create
    @venue = Venue.new(venue_params)

    respond_to do |format|
      if @venue.save
        format.html { redirect_to @venue, notice: 'Venue was successfully created.' }
        format.json { render action: 'show', status: :created, location: @venue }
      else
        format.html { render action: 'new' }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /venues/1
  # PATCH/PUT /venues/1.json
  def update
    respond_to do |format|
      if @venue.update(venue_params)
        format.html { redirect_to @venue, notice: 'Venue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /venues/1
  # DELETE /venues/1.json
  def destroy
    @venue.destroy
    respond_to do |format|
      format.html { redirect_to venues_url }
      format.json { head :no_content }
    end
  end

  def tag_cloud
    @tags = Venue.tag_counts_on(:features)
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venue
      @venue = Venue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def venue_params
      params.require(:venue).permit(:name, :phone, :email, :contact_name, 
       :description, :aasm_state, :hours, :happy_hours, :full_street_address)
    end






end

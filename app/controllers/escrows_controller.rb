class EscrowsController < ApplicationController
  before_action :set_escrow, only: [:show, :edit, :update, :destroy]

  # GET /escrows
  # GET /escrows.json
  def index
    @escrows = Escrow.all
  end

  # GET /escrows/1
  # GET /escrows/1.json
  def show
  end

  # GET /escrows/new
  def new
    @escrow = Escrow.new
  end

  # GET /escrows/1/edit
  def edit
  end

  # POST /escrows
  # POST /escrows.json
  def create
    @escrow = Escrow.new(escrow_params)

    respond_to do |format|
      if @escrow.save
        format.html { redirect_to @escrow, notice: 'Escrow was successfully created.' }
        format.json { render action: 'show', status: :created, location: @escrow }
      else
        format.html { render action: 'new' }
        format.json { render json: @escrow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /escrows/1
  # PATCH/PUT /escrows/1.json
  def update
    respond_to do |format|
      if @escrow.update(escrow_params)
        format.html { redirect_to @escrow, notice: 'Escrow was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @escrow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /escrows/1
  # DELETE /escrows/1.json
  def destroy
    @escrow.destroy
    respond_to do |format|
      format.html { redirect_to escrows_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_escrow
      @escrow = Escrow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def escrow_params
      params.require(:escrow).permit(:user_id, :description, :btc_amount, :buyer_email, :seller_email, :btc_escrow_fee, :btc_seller_fee, :btc_buyer_fee, :tracking_number, :btc_amount_seller_will_receive, :max_shipping_days, :inspection_days, :payee_invitation, :payer_invitation, :btc_address, :payment_invitation, :payment_confirmation, :private_WIF_key, :aasm_state)
    end
end

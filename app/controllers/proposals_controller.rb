class ProposalsController < ApplicationController
  before_action :set_proposal, only: [:show, :charge, :edit, :update, :destroy]
  after_action :verify_authorized, only: [:update] 
  # GET /proposals
  # GET /proposals.json
  def index
    @proposals = Proposal.where(category_id: params[:category])
  end

  # GET /proposals/1
  # GET /proposals/1.json
  def show
    @proposals = Proposal.where(category_id: params[:category])
    @orders = Order.where(proposal_id: @proposal.id)
    @items_remaining = @proposal.full_order_quantity - @orders.sum(:order_quantity)
    if Order.where(user_id: current_user.id).exists?
      if Order.where(user_id: current_user.id).last.created_at < (Time.now - 10.seconds) && 
         Order.where(user_id: current_user.id).last.charge_identifier=="Unpaid"
         Order.where(user_id: current_user.id).last.destroy
      end
    end
    
  end

  def charge
  @amount = (Order.where(user_id: current_user.id).last.order_quantity)*(@proposal.cost_per_unit).to_i
  customer = Stripe::Customer.create(
    email: params[:stripeEmail],
    source: params[:stripeToken]
  )
#  current_user.charge_identifier = customer.id

    if current_user.save
    charge = Stripe::Charge.create(
    customer: customer.id,
    amount:  @amount*100,
    description: Proposal.find(params[:id]).description,
    currency: 'aud')
  # current_users.charges << Charge.new(charge_id: charge.id)

  flash[:notice] = 'Payment Made'
  Order.last.update_columns(charge_identifier: "Paid")
  redirect_to '/'
          else 
        flash[:notice] = 'Error'
        redirect_back fallback_location: '/'
        Order.where(user_id: current_user.id).last.destroy
          end
        end        
        # rescue Stripe::CardError => e
        # flash[:error] = e.message
        # redirect_back fallback_location: '/'

  def create_order
    @orders = Order.all
    @profile = Profile.where(user_id: current_user.id).last.ship_street_number
      if @profile != ""
        if  params[:order_quantity].to_f < Proposal.find(params[:id]).min_order_quantity
          flash[:notice] = '********  Error, Your order is below the minimum order quantity *********'
        end

        if params[:order_quantity].to_f > Proposal.find(params[:id]).min_order_quantity && 
          params[:order_quantity].to_f <= Proposal.find(params[:id]).full_order_quantity - 
          Order.where(proposal_id: Proposal.find(params[:id])).sum(:order_quantity)
          @order = Order.create!([{user_id: current_user.id , proposal_id: params[:id], 
          order_quantity: params[:order_quantity], charge_identifier: "Unpaid", amount_paid: (params[:order_quantity].to_f*Proposal.find(params[:id]).cost_per_unit)}])
          ModelMailer.new_order_notification(@order).deliver_now
          redirect_to request.referrer
        else 
          flash[:notice] = '********  Error, insufficient quantity remaining on proposal, please reduce your order *********'
          redirect_to request.referrer
        end
      else
         flash[:notice] = '********   Please complete your profile before placing an order.   ********'
        redirect_to "/profiles/#{current_user.id}/edit"
      end   
  end

  # GET /proposals/new
  def new
    @proposal = Proposal.new
  end

  # GET /proposals/1/edit
  def edit
  end

  # POST /proposals
  # POST /proposals.json
  def create
    @proposal = Proposal.new(proposal_params)
    # @order = Order.new(order_params)
    @proposal.user_id = current_user.id if current_user
    # @order.user_id = current_user.id if current_user
    # @proposal.user_id = current_user.id
    respond_to do |format|
      if @proposal.save
        format.html { redirect_to @proposal, notice: 'Proposal was successfully created.' }
        format.json { render :show, status: :created, location: @proposal }
      else
        format.html { render :new }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end



  # PATCH/PUT /orders/1
  # PATCH/PUT /proposals/1.json
  def update
    authorize @proposal
    respond_to do |format|
      if @proposal.update(proposal_params)
        format.html { redirect_to @proposal, notice: 'Proposal was successfully updated.' }
        format.json { render :show, status: :ok, location: @proposal }
      else
        format.html { render :edit }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proposals/1
  # DELETE /proposals/1.json
  def destroy
    @proposal.destroy
    respond_to do |format|
      format.html { redirect_to proposals_url, notice: 'Proposal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proposal
      @proposal = Proposal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proposal_params
      params.require(:proposal).permit(:product_name, :description, :cost_per_unit, :weight_per_unit, :min_order_quantity, :full_order_quantity, :eta, :img1, :img2, :img3, :category_id, :url)
    end
end

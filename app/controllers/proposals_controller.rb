class ProposalsController < ApplicationController
  before_action :set_proposal, only: [:show, :edit, :update, :destroy]

  # GET /proposals
  # GET /proposals.json
  def index
    @proposals = Proposal.where(category_id: params[:category])
  end

  # GET /proposals/1
  # GET /proposals/1.json
  def show
  end

  def create_order
    if params[:order_quantity].to_f < Proposal.find(params[:id]).full_order_quantity
    Order.create!([{user_id: current_user.id , proposal_id: params[:id], order_quantity: params[:order_quantity], charge_identifier: "", amount_paid: (params[:order_quantity].to_f*Proposal.find(params[:id]).cost_per_unit)}])
    redirect_to '/'
    else 
    redirect_to '/'
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
    @proposal.user_id = current_user.id if current_user
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

  # PATCH/PUT /proposals/1
  # PATCH/PUT /proposals/1.json
  def update
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
      params.require(:proposal).permit(:product_name, :description, :cost_per_unit, :weight_per_unit, :min_order_quantity, :full_order_quantity, :eta, :img1, :img2, :img3, :category_id)
    end
end

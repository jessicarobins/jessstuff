class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
    @spec = Spec.find(params[:id])
    puts "we did this bit"
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @spec_id = params[:ticket][:spec_id]
    @ticket = Ticket.new(:name => params[:ticket][:name], :spec_id => @spec_id)

    if @ticket.save
      # redirect_to '/specs'
    else
      @spec = Spec.find(@spec_id)
      render :action => 'new'
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(add_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket_id = @ticket.id
    @ticket.update_attributes!(:deleted_by_id => current_user.id)
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params[:ticket]
    end
    
    def add_params
      params.permit(:ticket).require(:name, :spec_id)
    end
end

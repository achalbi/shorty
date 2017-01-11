class ShortVisitsController < ApplicationController
  before_action :set_short_visit, only: [:show, :update, :destroy]

  # GET /short_visits
  def index
    @short_visits = ShortVisit.all

    render json: @short_visits
  end

  # GET /short_visits/1
  def show
    render json: @short_visit
  end

  # POST /short_visits
  def create
    @short_visit = ShortVisit.new(short_visit_params)

    if @short_visit.save
      render json: @short_visit, status: :created, location: @short_visit
    else
      render json: @short_visit.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /short_visits/1
  def update
    if @short_visit.update(short_visit_params)
      render json: @short_visit
    else
      render json: @short_visit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /short_visits/1
  def destroy
    @short_visit.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_short_visit
      @short_visit = ShortVisit.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def short_visit_params
      params.require(:short_visit).permit(:short_url_id, :visitor_ip, :visitor_city, :visitor_state, :visitor_country)
    end
end

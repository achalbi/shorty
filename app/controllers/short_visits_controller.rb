class ShortVisitsController < ApplicationController
  before_action :set_short_visit, only: [:show, :destroy]

  # GET /short_visits
  def index
    @short_visits = ShortVisit.all
    render json: @short_visits
  end

  # GET /short_visits/1
  def show
    render json: @short_visit
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
end

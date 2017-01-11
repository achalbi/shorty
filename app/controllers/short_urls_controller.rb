class ShortUrlsController < ApplicationController
  include FreegeoipUtils

  before_action :set_short_url, only: [:show, :destroy]
  before_action :validate_user

  # GET /short_urls
  def index
    @short_urls = ShortUrl.page(params[:page] ? params[:page][:number] : 1)

    render json: @short_urls
  end

  # GET /short_urls/1
  def show
    render json: @short_url
  end

  # POST /short_urls
  def create
    @short_url = ShortUrl.new(short_url_params)
    @short_url.user = current_user 
    begin
      @short_url.shorty = ShortUrl.generate_shorty
    # might want to break out after valid
    end until @short_url.valid?

    if @short_url.save
      render json: @short_url, status: :created, location: @short_url
    else
      render json: @short_url.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /short_urls/1
  def update
    if @short_url.update(short_url_params)
      render json: @short_url
    else
      render json: @short_url.errors, status: :unprocessable_entity
    end
  end

  # DELETE /short_urls/1
  def destroy
    @short_url.destroy
  end

  #Track urls
  def track
    get_visitor_details(request.remote_ip)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_short_url
      @short_url = ShortUrl.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def short_url_params
      params.require(:short_url).permit(:original_url)
    end

    def set_short_url_by_shorty
      @short_url = ShortUrl.find_by(shorty: params[:shorty])
    end
end

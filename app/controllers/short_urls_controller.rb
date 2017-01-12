class ShortUrlsController < ApplicationController
  include FreegeoipUtils

  before_action :set_short_url, only: [:destroy, :show]
  before_action :set_short_url_by_shorty, only: [:shorty]
  before_action :validate_user, except: [:show]

  # GET /short_urls
  def index
    @short_urls = current_user.short_urls.page(params[:page] ? params[:page][:number] : 1)
    render json: @short_urls, each_serializer: ShortUrlsListSerializer

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
    end until @short_url.valid? # might want to break out after valid
    if @short_url.save
      render json: @short_url, status: :created, location: @short_url
    else
      render_error(@short_url, :unprocessable_entity)
    end
  end

  # PATCH/PUT /short_urls/1
  def update
    if @short_url.update(short_url_params)
      render json: @short_url
    else
      render_error(@short_url, :unprocessable_entity)
    end
  end

  # DELETE /short_urls/1
  def destroy
    @short_url.destroy
  end

  def shorty
    ip = '117.216.146.232' #request.remote_ip  # use commented code for productions
    visitor_data = get_visitor_details(ip)
    @short_url.short_visits.build(
      visitor_ip: visitor_data["ip"], 
      visitor_city: visitor_data["city"],
      visitor_state: visitor_data["region_name"],
      visitor_country: visitor_data["country_name"])
    if @short_url.save
      redirect_to @short_url.normalized_url, status: :moved_permanently 
    else
      render_error(@short_url, :unprocessable_entity)
    end
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

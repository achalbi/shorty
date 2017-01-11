class ApplicationController < ActionController::API
  before_action :check_header

  def current_user
  	@current_user
  end

  private
  def check_header
    if ['POST','PUT','PATCH'].include? request.method
      if request.content_type != "application/vnd.api+json"
        head 406 and return
      end
    end
  end

  def validate_user
  	token = request.headers["X-Api-Key"]
    head 403 and return unless token
    @current_user = User.find_by token: token
    head 403 and return unless @current_user
  end

  def render_error(resource, status)
    render json: resource, status: status, adapter: :json_api, serializer: ActiveModel::Serializer::ErrorSerializer
  end

end

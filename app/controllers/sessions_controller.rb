class SessionsController < ApplicationController
before_action :set_user, only: [:create]

  def create
    if @user.authenticate(params[:session][:password])
      @user.regenerate_token	
      render json: @user, status: :created,
             serializer: ActiveModel::Serializer::SessionSerializer and return
    end
    head 403 #forbidden error
  end

  def destroy
    user = User.where(token: params[:id]).first
    head 404 and return unless user # not found error
    user.regenerate_token
    head 204 #success no-content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by(email: params[:session][:email])
      head 406 and return unless @user #not acceptable response
    end

end
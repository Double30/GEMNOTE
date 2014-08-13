class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  layout :app_layout
  before_action :set_search
  protect_from_forgery with: :exception
  helper_method :current_user_categories


  def current_user_categories
    @categories = Category.where(user: current_user)
  end

  protected

  def set_search
    @q = Category.search(params[:q])
  end

  private

  def app_layout
    current_user.present? ? "application" : "unlogin"
  end
end

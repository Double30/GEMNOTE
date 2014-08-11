class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :set_search

  protect_from_forgery with: :exception

  helper_method :all_categories

  def all_categories
    @categories = Category.all
  end



  protected

  def set_search
    @q = Category.search(params[:q])
  end
end

class StarsController < ApplicationController
  before_action :set_star, only: [ :show, :update ]
  def index
    current_user.update_starred_repo
    @stars = current_user.stars.includes(:repository)
  end

  def show

  end

  def update
    respond_to do |format|
      if @star.update_attributes(star_params)
        format.html { redirect_to(@star, :notice => 'User was successfully updated.') }
        format.json { respond_with_bip(@star) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@star) }
      end
    end
  end
  private
    def set_star
       @star = Star.includes(:repository).find(params[:id])
    end

    def star_params
      params.require(:star).permit(:description)
    end
end
class RepositoriesController < ApplicationController
  before_action :set_repo, only: [ :show, :update ]
  def index
    current_user.update_starred_repo
    @repos = current_user.repositories

  end

  def show
    if user_signed_in?
      star_related
    end
    @popular_notes = popular_notes_for(@repo)
  end

  def update
    respond_to do |format|
      if @repo.update_attributes(repo_params)
        format.html { redirect_to(@repo, :notice => 'User was successfully updated.') }
        format.json { respond_with_bip(@repo) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@repo) }
      end
    end
  end
  private
    def set_repo
       @repo = Repository.find(params[:id])
    end

    def star_related
      @star = @repo.stars.find_by(user: current_user)
      @notes = @star.notes.includes(:user)
    end

    def repo_params
      params.require(:repository).permit(:description)
    end

    def popular_notes_for(repo)
      results = []
      repo.stars.each do |star|
        results += star.notes
      end
      results
    end
end

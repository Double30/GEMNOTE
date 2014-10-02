class RepositoriesController < ApplicationController
  before_action :set_repo, only: [ :show, :update ]
  def index
    # Repository.refresh_by_user(current_user)
    @repos = current_user.repositories
  end

  def show

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

    def repo_params
      params.require(:repository).permit(:description)
    end
end

class RepositoriesController < ApplicationController
  before_action :set_repo, only: [ :show ]
  def index
    # Repository.refresh_by_user(current_user)
    @repos = current_user.repositories
  end

  def show

  end

  private
    def set_repo
       @repo = Repository.find(params[:id])
    end
end

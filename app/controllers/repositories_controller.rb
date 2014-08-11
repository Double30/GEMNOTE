class RepositoriesController < ApplicationController
  def index
    Repository.refresh_by_user(current_user)
    @repos = current_user.repositories
  end
end

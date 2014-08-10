class RepositoriesController < ApplicationController
  def index
    @repos = current_user.github.starred
  end
end

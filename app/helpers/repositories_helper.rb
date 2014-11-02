module RepositoriesHelper
  def repository_full_name(repo)
    "#{repo.owner_name}/#{repo.name}"
  end
end

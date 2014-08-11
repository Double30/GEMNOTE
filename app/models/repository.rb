# == Schema Information
#
# Table name: repositories
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  url                :string(255)
#  description        :text
#  user_id            :integer
#  category_id        :integer
#  created_at         :datetime
#  updated_at         :datetime
#  github_id          :integer
#  github_description :text
#  full_name          :string(255)
#  stargazers_count   :integer
#  owner_id           :integer
#  owner_name         :string(255)
#  is_delete          :boolean
#  is_new             :boolean
#

class Repository < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  validates :github_id, uniqueness: {scope: :user_id}, presence: true
  has_many :tags, through: :repositories_tags

  def self.refresh_by_user(user)
    repos = user.github.starred.map do |github_repo|
      user.repositories.find_or_create_by(github_id: github_repo.id) do |repo|
        repo.name = github_repo.name
        repo.full_name = github_repo.full_name
        repo.url = github_repo.url
        repo.github_description = github_repo.description
        repo.stargazers_count = github_repo.stargazers_count
        repo.owner_id = github_repo.owner.id
        repo.owner_name = github_repo.owner.login
        repo.is_new = true if repo.new_record?
      end
    end
    Repository.mark_deletion(user, repos, user.repositories)
  end

  def self.mark_deletion(user, pre_list, current_list)
    pre_list.map! do |repo|
      repo.github_id
    end
    current_list.map! do |repo|
      repo.github_id
    end
    (current_list - pre_list).each do |github_id|
      if repo = Repository.find_by(github_id: github_id, user_id: user)
        repo.is_delete = true
        repo.save
      end
    end
  end
end

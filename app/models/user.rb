# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  provider               :string(255)
#  uid                    :string(255)
#  oauth_token            :string(255)
#  image                  :string(255)
#  url                    :string(255)
#  name                   :string(255)
#
require 'Octokit'
class User < ActiveRecord::Base
  has_many :repositories, through: :stars
  has_many :stars

  has_many :categories
  has_many :tags
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:github]

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name || auth.info.nickname   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      user.url = auth.info.urls.GitHub
      user.oauth_token = auth.credentials.token
    end
  end

  def github
    Octokit::Client.new(:access_token => oauth_token, auto_traversal: true, per_page: 100)
  end

  def update_starred_repo
    repos = github.starred.map do |github_repo|
      repo = Repository.find_or_create_by(github_id: github_repo.id) do |repo|
        repo.name               = github_repo.name
        repo.full_name          = github_repo.full_name
        repo.url                = github_repo.html_url
        repo.github_description = github_repo.description
        repo.stargazers_count   = github_repo.stargazers_count
        repo.owner_id           = github_repo.owner.id
        repo.owner_name         = github_repo.owner.login
      end

      starred_repo = repo.stars.find_or_initialize_by(user_id: id)
      starred_repo.is_new = true if starred_repo.new_record?
      starred_repo.save
    end
  end
end

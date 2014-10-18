# == Schema Information
#
# Table name: stars
#
#  id            :integer          not null, primary key
#  repository_id :integer
#  user_id       :integer
#  category_id   :integer
#  description   :text
#  is_new        :boolean
#  is_deleted    :boolean
#  created_at    :datetime
#  updated_at    :datetime
#

class Star < ActiveRecord::Base
  belongs_to :repository
  belongs_to :user
  belongs_to :category
  has_many :tags, through: :repositories_tags
  has_many :notes
  delegate :name, :url, :github_id, :github_description, :full_name,
    :stargazers_count, :owner_id, :owner_name,
    to: :repository
  default_scope order('updated_at DESC')
end

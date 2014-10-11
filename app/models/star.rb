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
end

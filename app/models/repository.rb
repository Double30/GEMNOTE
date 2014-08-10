# == Schema Information
#
# Table name: repositories
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  star        :integer
#  url         :string(255)
#  description :text
#  user_id     :integer
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Repository < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :tags, through :repositories_tags
end

# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  color      :string(255)
#  image      :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Tag < ActiveRecord::Base
  belongs_to :user
  has_many :repositories, through: :repositories_tags
  validates :name, uniqueness: {scope: :user_id, case_sensitive: false }, presence: true
end

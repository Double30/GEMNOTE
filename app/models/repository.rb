# == Schema Information
#
# Table name: repositories
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  url                :string(255)
#  description        :text
#  created_at         :datetime
#  updated_at         :datetime
#  github_id          :integer
#  github_description :text
#  full_name          :string(255)
#  stargazers_count   :integer
#  owner_id           :integer
#  owner_name         :string(255)
#

class Repository < ActiveRecord::Base
  has_many :notes
  has_many :stargazers, class_name: 'User', through: :stars
  has_many :stars

  validates :github_id, uniqueness: true, presence: true

end

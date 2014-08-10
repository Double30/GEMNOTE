# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  order      :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Category < ActiveRecord::Base
  belongs_to :user
  has_many :repositories
end

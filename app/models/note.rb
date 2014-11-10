# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#  star_id    :integer
#  user_id    :integer
#

class Note < ActiveRecord::Base
  belongs_to :star
  belongs_to :user
  validates :name, uniqueness: {scope: :star_id }, presence: true
end

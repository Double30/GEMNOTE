# == Schema Information
#
# Table name: notes
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  content       :text
#  repository_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Note < ActiveRecord::Base
  belongs_to :star
  validates :name, uniqueness: {scope: :star_id }
end

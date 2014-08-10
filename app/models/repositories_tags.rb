# == Schema Information
#
# Table name: repositories_tags
#
#  repository_id :integer
#  tag_id        :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class RepositoriesTags < ActiveRecord::Base
  belongs_to :repository
  belongs_to :tag
end

# == Schema Information
#
# Table name: request_relationships
#
#  id         :integer          not null, primary key
#  request_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RequestRelationship < ApplicationRecord
  belongs_to :request
  belongs_to :user
end

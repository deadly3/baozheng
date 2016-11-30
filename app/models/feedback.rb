class Feedback < ApplicationRecord
  belongs_to :user
  belongs_to :request

  validates :user_id, presence: true
  validates :rating, presence: true, numericality: { greater_than: 0}
end

# == Schema Information
#
# Table name: feedbacks
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  rating     :integer
#  commit     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  request_id :integer
#

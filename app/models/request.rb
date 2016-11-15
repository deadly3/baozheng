# == Schema Information
#
# Table name: requests
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  title          :string
#  description    :text
#  before_picture :string
#  dream_picture  :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  aasm_state     :string           default("request_made")
#  token          :string
#

class Request < ApplicationRecord
  belongs_to :user

  has_many :request_relationships
  has_many :applicants, through: :request_relationships, source: :user

  mount_uploader :before_picture, BeforePictureUploader
  mount_uploader :dream_picture, DreamPictureUploader

  validates :title, presence: true

  scope :recent, -> {order("created_at DESC")}

  before_create :generate_token

  # def join_applicants!(user)
  #   applicants << user
  # end

  def has_been_applied_by?(user)
    applicants.include?(user)
  end

  def generate_token
    self.token = SecureRandom.uuid
  end

  include AASM

  aasm do
    state :request_made, initial: true
    state :applied
    state :selected
    state :paid

    event :apply do
      transitions from: :request_made, to: :applied
    end

    event :choose do
      transitions from: :applied, to: :selected
    end

    event :make_payment do
      transitions from: :selected, to: :paid
    end
  end

end

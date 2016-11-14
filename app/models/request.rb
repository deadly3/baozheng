# == Schema Information
#
# Table name: requests
#
#  id             :integer          not null, primary key
#  title          :string
#  description    :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#  before_picture :string
#  dream_picture  :string
#  before_picture  :string
#  dream_picture   :string
#

class Request < ApplicationRecord
  belongs_to :user

  mount_uploader :before_picture, BeforePictureUploader
  mount_uploader :dream_picture, DreamPictureUploader


  validates :title, presence: true
end

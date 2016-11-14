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
#

class Request < ApplicationRecord
  belongs_to :user

  mount_uploader :before_picture, BeforePictureUploader
  mount_uploader :dream_picture, DreamPictureUploader


  validates :title, presence: true
end

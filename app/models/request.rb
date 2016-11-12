class Request < ApplicationRecord
  belongs_to :user

  mount_uploader :before_picture, BeforePictureUploader
  mount_uploader :dream_picture, DreamPictureUploader


  validates :title, presence: true
end

class Request < ApplicationRecord
  belongs_to :user

  mount_uploader :BeforePicture, BeforePictureUploader
  mount_uploader :DreamPicture, DreamPictureUploader


  validates :title, presence: true
end

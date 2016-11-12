class Work < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :price,presence: true, numericality: { greater_than: 0}

  mount_uploader :image, ImageUploader

end

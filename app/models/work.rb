class Work < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0}
  validates :image, presence: true

  mount_uploader :image, ImageUploader

  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end

end

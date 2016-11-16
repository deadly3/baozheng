# == Schema Information
#
# Table name: works
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  price       :integer
#  image       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  is_hidden   :boolean          default(TRUE)
#  user_id     :integer
#

class Work < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0}
  validates :image, presence: false

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

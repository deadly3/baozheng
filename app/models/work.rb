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
#

class Work < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0}
  validates :image, presence: true

  mount_uploader :image, ImageUploader

  belongs_to :user
end

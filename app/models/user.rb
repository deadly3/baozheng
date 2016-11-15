# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  is_admin               :boolean          default(FALSE)
#  nickname               :string           default("")
#  description            :text
#  avatar                 :string
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :requests

  def admin?
   is_admin
  end

  def make_user!
    self.is_admin = false
    self.save
  end

  def make_admin!
    self.is_admin = true
    self.save
  end


  include Gravtastic
  gravtastic :size => 50, :default => "mm"

  has_many :works

  scope :all_except, ->(user) { where.not(id: user) }

  mount_uploader :avatar, AvatarUploader
end

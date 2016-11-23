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
#  token                  :string
#  age                    :integer
#  district               :string
#  sex                    :string
#  is_designer            :boolean          default(FALSE)
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :generate_token

  def generate_token
    self.token = SecureRandom.hex(8)
  end

  has_many :works
  has_many :requests
  has_many :request_relationships
  has_many :applied_requests, :through => :request_relationships, :source => :request

  acts_as_messageable




  include Gravtastic
  gravtastic :size => 50, :default => "mm"

  scope :all_except, ->(user) { where.not(id: user) }

  mount_uploader :avatar, AvatarUploader

  def self.designer
    where(:is_designer => true )
  end

  def self.recent
    order("id DESC")
  end

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


  def send_message(recipients, msg_body, subject, request, sanitize_text = true, attachment = nil, message_timestamp = Time.now)
    convo = Mailboxer::ConversationBuilder.new(
      subject: subject,
      created_at: message_timestamp,
      updated_at: message_timestamp
    ).build

    message = Mailboxer::MessageBuilder.new(
      sender: self,
      conversation: convo,
      recipients: recipients,
      body: msg_body,
      subject: subject,
      attachment: attachment,
      created_at: message_timestamp,
      updated_at: message_timestamp
    ).build

    convo.request_id = request.id
    convo.save

    message.deliver false, sanitize_text
  end

end

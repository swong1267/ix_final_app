class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :spaces, dependent: :destroy

  has_many :event_requests, through: :events, source: :requests
  has_many :space_requests, through: :spaces, source: :requests

  has_many :sent_messages, class_name: 'Message', foreign_key: "sender_id", dependent: :destroy
  has_many :received_messages, class_name: 'Message', foreign_key: "recipient_id", dependent: :destroy
end

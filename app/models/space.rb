class Space < ActiveRecord::Base
  has_many :requests, dependent: :destroy
  belongs_to :user
end

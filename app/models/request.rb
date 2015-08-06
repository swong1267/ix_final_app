class Request < ActiveRecord::Base
  belongs_to :space
  belongs_to :event

  validates :body, length: { maximum: 120 }

  enum status: [ :unanswered, :confirmed, :denied ]
end

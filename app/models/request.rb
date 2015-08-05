class Request < ActiveRecord::Base
  belongs_to :space
  belongs_to :event

  enum state: [:unanswered, :confirmed, :denied]
end

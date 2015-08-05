class Request < ActiveRecord::Base
  belongs_to :space
  belongs_to :event

  enum status: [ :unanswered, :confirmed, :denied ]
end

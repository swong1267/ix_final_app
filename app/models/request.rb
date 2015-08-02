class Request < ActiveRecord::Base
  belongs_to :user, :space
end

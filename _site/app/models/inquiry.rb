class Inquiry < ActiveRecord::Base
  belongs_to :space
  belongs_to :event
end
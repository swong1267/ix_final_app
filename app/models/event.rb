class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :space
  validates :name, :location, :people, :description, presence: true
  validates :people, numericality: { only_integer: true, greater_than: 0 }
  validates :public, exclusion: { in: [nil] }
  validates :category, inclusion: { in: ["Workshop/Class", "Gathering", "Meeting/Conference", "Performance", "Gallery", "Personal", "Other"] }

end

class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :space
  has_many :inquiries, foreign_key: "event_id", dependent: :destroy
  validates :name, :location, :people, :category, :description, presence: true
  validates :people, numericality: { only_integer: true, greater_than: 0 }
  validates :public, exclusion: { in: [nil] }
  validates :category, inclusion: { in: ["Workshop/Class", "Gathering", "Meeting/Conference", "Performance", "Gallery", "Personal", "Other"] }

end

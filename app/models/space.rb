class Space < ActiveRecord::Base
  has_many :events, dependent: :destroy
  belongs_to :user
  validates :name, :description, :location, :price, :capacity, presence: true
  validates :price, :capacity, numericality: { only_integer: true, greater_than: 0 }
  validates :category, inclusion: { in: ["Display", "Room", "Building", "Outdoor Area", "Other"] }
end

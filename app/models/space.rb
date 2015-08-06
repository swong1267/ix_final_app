class Space < ActiveRecord::Base
  has_many :events, dependent: :destroy
  has_many :reviews, dependent: :destroy  
  has_many :requests, foreign_key: "space_id", dependent: :destroy
  belongs_to :user
  validates :name, :category, :description, :location, :price, :capacity, presence: true
  validates :price, :capacity, numericality: { only_integer: true, greater_than: 0 }
  validates :category, inclusion: { in: ["Display", "Room", "Building", "Outdoor Area", "Other"] }

  geocoded_by :location
  after_validation :geocode

  has_attached_file :avatar, :styles => { :medium => "350x239>", :thumb => "100x100>" }, :default_url => "/img/missingspace_:style.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end

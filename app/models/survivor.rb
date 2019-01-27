class Survivor < ApplicationRecord
  has_and_belongs_to_many :resources

	validates :name, presence: true
	validates :age, presence: true
	validates :gender, presence: true
	validates :latitude, presence: true
	validates :longitude, presence: true
end

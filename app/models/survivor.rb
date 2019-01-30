class Survivor < ApplicationRecord
  has_and_belongs_to_many :resources
	has_many :survivor_indicator, :class_name => 'Survivor', :foreign_key => 'survivor_id'
  has_many :survivor_infected, :class_name => 'Survivor', :foreign_key => 'survivor_id'

	validates :name, presence: true
	validates :age, presence: true
	validates :latitude, presence: true
	validates :longitude, presence: true
  

  def validate_gender
	 if gender.upcase != 'F' && gender.upcase != 'M' && gender.upcase != 'U'
		 	errors.add(:gender, message:'Gender must be F, M or U')
		end
	end

	def validate_resources
		errors.clear
		if resources.size.eql? 0
		 	errors.add(:resources, message: 'Add, at least, one resource') 
		end
	end
end

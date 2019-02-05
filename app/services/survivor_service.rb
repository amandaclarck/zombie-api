class SurvivorService
	class << self
	  def create(survivor)
	    @survivor = Survivor.new(survivor)
	  end
	end
end
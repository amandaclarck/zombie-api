class SurvivorService
	class << self
	  def create(survivor)
	    @survivor = Survivor.new(survivor)
=begin
      @resources = Resource.where(id: @survivor.resources.map { |r| r.id })
	    if @resources.length > 0
			  @survivor.resources << @resources
	    end
=end
	  end
	end
end
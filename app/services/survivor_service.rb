class SurvivorService
	class << self
	  def create(params)
	    @survivor = Survivor.new(params)
=begin
      @resources = Resource.where(id: @survivor.resources.map { |r| r.id })
	    if @resources.length > 0
			  @survivor.resources << @resources
	    end
=end
	  end

	  def mark_as_infected(params)
	    @survivor_indicator = Survivor.find(params[:survivor_id])
	    @survivor_infected = Survivor.find(params[:id])

	    @survivor_ids = []
	    @survivor_ids << @survivor_indicator
	    @survivor_ids << @survivor_infected

	    @survivor_infections = []
	    @survivor_infections = SurvivorInfection.where(survivor_indicator_id: @survivor_ids.map(&:id))

    	if @survivor_infections.empty?
      	SurvivorInfection.create(survivor_indicator_id: @survivor_ids[0].id, survivor_infected_id: @survivor_ids[1].id)
    	end
    	@survivor_infected
    end
	end
end
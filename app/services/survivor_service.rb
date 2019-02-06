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
	    @survivor_indicator = Survivor.find(params[:survivor_indicator])
	    @survivor = Survivor.find(params[:id]) #infected

	    @survivor_ids = []
	    @survivor_ids << @survivor_indicator
	    @survivor_ids << @survivor

	    @survivor_infections = []
	    @survivor_infections = SurvivorInfection.where(survivor_indicator_id: @survivor_ids[0].id, survivor_infected_id: @survivor_ids[1].id)

	    @survivor_ids.each { |s| puts s.attributes}
    	if @survivor_infections.empty?
      	SurvivorInfection.create(survivor_indicator_id: @survivor_ids[0].id, survivor_infected_id: @survivor_ids[1].id)
      else
      	@survivor.errors.add(:id, message:'Can not be marked as infected by the same survivor')
    	end
    	@survivor
  	end
	end
end
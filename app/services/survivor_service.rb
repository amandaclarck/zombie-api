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

    	if @survivor_infections.empty?
      	SurvivorInfection.create(survivor_indicator_id: @survivor_ids[0].id, survivor_infected_id: @survivor_ids[1].id)
      else
      	@survivor.errors.add(:id, message:'Can not be marked as infected by the same survivor')
    	end
    	@survivor
  	end


			
		def exchange_resources(params)
			@survivor = Survivor.find(params[:id])
			@survivor_to_exchange = Survivor.where('id = ?', params[:survivor_id_to_exchange]).where(infected: true)
			@survivor_points = Survivor.joins(:resources, :survivor_infections).where(id: @survivor.id).sum(:points)
			@survivor_to_exchange_points = Survivor.joins(:resources, :survivor_infections)
			.where(id: @survivor_to_exchange.ids).sum(:points)

			if @survivor_points.eql? @survivor_to_exchange_points
				 #@survivor.resources << @survivor_to_exchange_points
				 Survivor.find(id: @survivor_to_exchange.id)
				 puts @survivor_to_exchange.id
			else
      	@survivor.errors.add(:id, message: 'The sum of points is not equal')
			end
			

			#select * from survivors where id = params[:id] //voce
			#Select * From survivors where infected = true and id = survivor_q_quero_trocar pontos
			#if soma de pontos do survivor_q_quero_etc != do survivor_voce => erro
			#senão fazer o update com os ids das resources do survivor_q_quero_trocar_pontos para survivor_você
		end
	end
end
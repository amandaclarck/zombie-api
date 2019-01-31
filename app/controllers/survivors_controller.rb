class SurvivorsController < ApplicationController
	def index
		render json: {data: Survivor.all}
	end

	def show
		survivor_id
		render json: {data: survivor_id}

	end

	def new
		@survivor = Survivor.new(survivor_params)
	end

	def create
		@survivor = Survivor.new(survivor_params)
    @survivor.resources << Resource.where(id: params[:resources].map { |r| r['id'] })

		if @survivor.validate_gender || @survivor.validate_resources
			render json: {status: 'ERROR', message: @survivor.errors}, status: :unprocessable_entity 
		else
			if @survivor.save
				render json: {status: 'SUCCESS', message:'Survivor created!', data: @survivor}, status: :ok
			else
				render json: {status: 'ERROR', message:'Survivor not created', data:@survivor.errors}, status: :unprocessable_entity
			end
		end
	end

	def update
		@survivor = Survivor.find(params[:survivor_infected])
		

		if @survivor.update(survivor_update_params) 
			render json: {status: 'SUCCESS', message:'Survivor updated!', data: @survivor}, status: :ok
		else
			render json: {status: 'ERROR', message:'Survivor not updated', data:@survivor.errors}, status: :unprocessable_entity
		end
	end

	def mark_as_infected
    @survivor_indicator = Survivor.find(params[:survivor_id])
    @survivor_infected = Survivor.find(params[:survivor_infected])

    @survivor_ids = []
    @survivor_ids << @survivor_indicator
    @survivor_ids << @survivor_infected

    @survivor_infections = []
    @survivor_infections = SurvivorInfection.where(survivor_indicator_id: @survivor_ids.map { |e| e.id })

		@survivor = Survivor.find(params[:survivor_id])

    if @survivor_infections.size > 0
			render json: {status: 'ERROR', message:'Can not be marked as infected by the same survivor', data:@survivor.errors}, status: :unprocessable_entity
    else
    	SurvivorInfection.create(survivor_indicator_id: @survivor_ids[0].id, survivor_infected_id: @survivor_ids[1].id)
    	update
    end
	end

	private 
	def survivor_params
		params.require(:survivor).permit(:name, :age, :gender, :latitude, :longitude, resources: [])
	end

	def survivor_update_params
		params.require(:survivor).permit(:name, :age, :gender, :latitude, :longitude, :infected)
	end

	def survivor_id
		@survivor = Survivor.find(params[:id])
	end

end

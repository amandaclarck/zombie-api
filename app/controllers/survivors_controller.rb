class SurvivorsController < ApplicationController
	def index
	end

	def show
		survivor_id
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
		survivor_id

		if @survivor.update(survivor_params)
			render json: {status: 'SUCCESS', message:'Survivor updated!', data: @survivor}, status: :ok
		else
			render json: {status: 'ERROR', message:'Survivor not updated', data:@survivor.errors}, status: :unprocessable_entity
		end
	end

	def mark_as_infected
    @survivor_ids << Survivor.where(id: params[:survivors].map { |s| s['id'] })
    @survivor_infections = SurvivorInfection.where(id: params[:survivors].map { |s| s['id'] })

    if @survivor_infections.size > 0
		#pegar id do indicador que vai marcar o survivor 2 como infectado e o id do infectado
		#verificar se já existe na tabela survivor_infection uma marcação para o id do survivor para o survivor 2
		#se existir, mostrar erro que o mesmo indicador não pode fazer duas indicações
		#se não existir, inserir o id do indicador e do survivor
	end

	private 
	def survivor_params
		params.require(:survivor).permit(:name, :age, :gender, :latitude, :longitude, resources: [])
	end

	def survivor_update_params
		params.require(:survivor).permit(:name, :age, :gender, :latitude, :longitude)
	end

	def survivor_id
		@survivor = Survivor.find(params[:id])
	end

end

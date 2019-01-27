class SurvivorsController < ApplicationController
	def index
#		@survivors = Survivor.first.resources

 #   format.json { render json: @survivors, status: :ok }

	end

	def show
		#@survivor = Survivor.first
		@survivors = Survivor.first.resources
    #format.json { render json: @survivor, status: :ok }
		render json: {status: 'SUCCESS', message:'Survivor(s) found!', data: @survivors},status: :ok

	end
=begin
	def new
	end

	def create
    @survivor = Survivor.new(survivor_params)

    if @survivor.save
			render json: {status: 'SUCCESS', message:'Survivor created!', data: @survivor},status: :ok
		else
			render json: {status: 'ERROR', message:'Survivor not created', data:@survivor.erros},status: :unprocessable_entity
    end
		
	end

	def show
		@survivor = Survivor.find(params[:id])
	end

	private 
	def survivor_params
		params.require(:survivor).permit(:name, :age, :gender, :latitude, :longitude)
	end
=end
end

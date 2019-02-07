# frozen_string_literal: true

class SurvivorsController < ApplicationController
  def index
    render json: { data: Survivor.all }
  end

  def show
    render json: { data: survivor_id }
  end

  def create
    @survivor = SurvivorService.create(survivor_params)
    @resources = Resource.where(id: params[:resources].map { |r| r['id'] })
    
    if @resources.length > 0
		  @survivor.resources << @resources
    end

  	if @survivor.save
  		render json: { status: 201, message: 'Survivor created!', data: @survivor }, status: :created
  	else
  		render json: { status: 422, message: 'Survivor not created', data: @survivor.errors}, status: :unprocessable_entity
   	end
  end

  def update
    survivor_id
    if @survivor.update(survivor_update_params)
      render json: { status: 201, message: 'Survivor updated!', data: @survivor }, status: :ok
    else
      render json: { status: 422, message: 'Survivor not updated', data: @survivor.errors }, status: :unprocessable_entity
    end
  end

  def mark_as_infected
    @survivor = SurvivorService.mark_as_infected(params)

    if @survivor.errors.empty?
    	update
    else
    	render json: { status: 422, data: @survivor.errors}, status: :unprocessable_entity
  	end

  	rescue ActiveRecord::RecordNotFound => e
			    render json: {
			      error: e.to_s
			    }, status: :not_found
	end

  def exchange_resources
    @survivor = SurvivorService.exchange_resources(params)
    #if @survivor.errors.empty?
     # update
    #end
    render json: {data: @survivor}
    rescue ActiveRecord::RecordNotFound => e
          render json: {
            error: e.to_s
          }, status: :not_found
  end

  private

  def survivor_params
    params.require(:survivor).permit(:name, :age, :gender, :latitude, :longitude, resources: []) #infected
  end

  def survivor_update_params
    params.require(:survivor).permit(:latitude, :longitude, :infected)
  end

  def survivor_id
    @survivor = Survivor.find(params[:id])
  end
end

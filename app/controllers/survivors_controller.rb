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
    @survivor = Survivor.find(params[:id])

    if @survivor.update(survivor_update_params)
      render json: { status: 201, message: 'Survivor updated!', data: @survivor }, status: :ok
    else
      render json: { status: 422, message: 'Survivor not updated', data: @survivor.errors }, status: :unprocessable_entity
    end
  end

  def mark_as_infected
    @survivor_indicator = Survivor.find(params[:survivor_id])
    @survivor_infected = Survivor.find(params[:survivor_infected])

    @survivor_ids = []
    @survivor_ids << @survivor_indicator
    @survivor_ids << @survivor_infected

    @survivor_infections = []
    @survivor_infections = SurvivorInfection.where(survivor_indicator_id: @survivor_ids.map(&:id))

    @survivor = Survivor.find(params[:survivor_id])

    if !@survivor_infections.empty?
      render json: { status: 'ERROR', message: 'Can not be marked as infected by the same survivor', data: @survivor.errors }, status: :unprocessable_entity
    else
      SurvivorInfection.create(survivor_indicator_id: @survivor_ids[0].id, survivor_infected_id: @survivor_ids[1].id)
      update
    end
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

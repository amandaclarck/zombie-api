# frozen_string_literal: true

class ResourcesController < ApplicationController
	def index
		render json: { data: Resource.all }
	end

	def resources_per_survivor
		render json: {data: Resource.joins(:survivors).where(id: params[:survivor_id])}
	end
end

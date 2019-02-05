# frozen_string_literal: true

class ResourcesController < ApplicationController
	def index
		render json: { data: Resource.all }
	end
end

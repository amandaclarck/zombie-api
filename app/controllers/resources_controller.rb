# frozen_string_literal: true

class ResourcesController < ApplicationController
  def index
    render json: { data: Resource.all }, status: :ok
  end

  def resources_per_survivor
    data = ResourceService.resources_per_survivor(params)
    render json: { data: data }, status: :ok
  end
end

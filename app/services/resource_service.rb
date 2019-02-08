# frozen_string_literal: true

class ResourceService
  class << self
    def resources_per_survivor(params)
      Resource.joins(:survivors).where('survivor_id = ?', params[:id])
    end

    def resources_quantity(resource_id)
      Resource.joins(:survivors).where(id: resource_id).count
    end
  end
end

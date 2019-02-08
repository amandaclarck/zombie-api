# frozen_string_literal: true

class SurvivorService
  class << self
    def create(params)
      @survivor = Survivor.new(params)
      @resources = Resource.where(id: params[:resources])
      @survivor.resources << @resources unless @resources.empty?
      @survivor
    end

    def mark_as_infected(params)
      @survivor_indicator = Survivor.find(params[:survivor_indicator])
      @survivor = Survivor.find(params[:id]) # infected

      @survivor_ids = []
      @survivor_ids << @survivor_indicator
      @survivor_ids << @survivor

      @survivor_infections = []
      @survivor_infections = SurvivorInfection.where(survivor_indicator_id: @survivor_ids[0].id, survivor_infected_id: @survivor_ids[1].id)

      if @survivor_infections.empty?
        SurvivorInfection.create(survivor_indicator_id: @survivor_ids[0].id, survivor_infected_id: @survivor_ids[1].id)
      else
        @survivor.errors.add(:id, message: 'Can not be marked as infected by the same survivor')
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
        ActiveRecord::Base.connection.execute("Delete from Resources_Survivors Where Survivor_Id = #{@survivor.id}")
        @resources = Resource.where(id: @survivor_to_exchange.map(&:resource_ids))
        @survivor.resources << @resources
      else
        @survivor.errors.add(:sum_points, message: 'The sum of points between the survivors is not equal')
      end
      @survivor
    end

    def survivors_quantity(resource_id)
      Survivor.joins(:resources).where('resource_id = ?', resource_id).count
    end

    def sum_points_of_resources_per_survivor
      Survivor.joins(:resources, :survivor_infections).where(infected: true).sum(:points)
    end
  end
end

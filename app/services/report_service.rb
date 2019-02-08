# frozen_string_literal: true

class ReportService
  class << self
    $const = 0

    def report
      infecteds = calculate_percentage_of_survivors(true)
      non_infecteds = calculate_percentage_of_survivors(false)
      avg = calculate_average_items

      @info = []
      @info << "Percentage of infecteds: #{infecteds.to_f.round(2)}"
      @info << "Percentage of non infecteds: #{non_infecteds.to_f.round(2)}"
      @info << avg
      @info << get_all_lost_points
    end

    def calculate_percentage_of_survivors(value)
      @survivors = Survivor.all.count
      percentage = 100.00
      @filtered_survivors = Survivor.where(infected: value).count
      @result = (@filtered_survivors.to_f / @survivors.to_f) * percentage
    end

    def calculate_average_items
      @resources = Resource.all
      avg = []
      @resources.each do |r|
        @resources_by_id = ResourceService.resources_quantity(r.id)
        @survivors = SurvivorService.survivors_quantity(r.id)
        unless @resources_by_id ==  $const || @survivors == $const
          avg << "Average amount of #{r.name} per survivor: #{(@resources_by_id.to_f / @survivors.to_f).round(2)} "
        end
      end
      avg
    end

    def get_all_lost_points
      @lost_points = []
      @points = SurvivorService.sum_points_of_resources_per_survivor
      @lost_points << if @points > $const
                        "Total points lost of infected survivors: #{@points}"
                      else
                        'Theres no points lost of infected survivors'
                      end
      @lost_points
    end
  end
end

class ReportService
	class << self

		def report
			@infecteds = calculate_percentage_of_survivors(true)
			@non_infecteds = calculate_percentage_of_survivors(false)
			@avg = calculate_average_items
			
			@info = []
			@info << "Average quantity of infecteds: #{@infecteds.to_f.round(2)}"
			@info << "Average quantity of non infecteds: #{@non_infecteds.to_f.round(2)}"
			@info << @avg
			@info << get_all_lost_points
		end

		def calculate_percentage_of_survivors(value)
			@survivors = Survivor.all.count
			@filtered_survivors = Survivor.where(infected: value).count
			@result = (@filtered_survivors.to_f / @survivors.to_f) * 100.00
		end

		def calculate_average_items
			@resources = Resource.all
			avg = []
			@resources.each do |r|
				@resources_by_id = Resource.joins(:survivors).where(id: r.id).count
				@survivors = Survivor.joins(:resources).where('resource_id = ?', r.id).count
				unless @resources_by_id == 0 || @survivors == 0
					avg << "Average amount of #{r.name} per survivor: #{(@resources_by_id.to_f / @survivors.to_f).round(2)} "
				end
			end
			avg
		end

		def get_all_lost_points
			@lost_points = []
			@points = Survivor.joins(:resources, :survivor_infections).where(infected: true).sum(:points)
			if @points > 0
				@lost_points << "Total points lost of infected survivors: #{@points}"
			else
				@lost_points << "Theres no points lost of infected survivors"
			end
			@lost_points
		end
	end
end
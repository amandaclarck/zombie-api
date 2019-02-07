# frozen_string_literal: true

class ReportsController < ApplicationController
	def index
		@report_service = ReportService.report
		render json: { data: @report_service }
	end
end

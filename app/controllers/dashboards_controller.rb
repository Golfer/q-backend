class DashboardsController < ApplicationController
  def index
	@pagy, @quotations = pagy(record_quotations) if record_quotations.count > 10 if record_quotations.count > 0
  end

  private
  	def record_quotations
  	  @record_quotations ||= Quotation.any? ? Quotation.random_records(100) : []
  	end	
end

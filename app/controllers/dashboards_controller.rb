class DashboardsController < ApplicationController
  def index
    @pagy, @quotations = pagy(Quotation.random_records(100))
  end
end

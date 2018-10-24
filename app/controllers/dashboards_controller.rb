class DashboardsController < ApplicationController
  def index
    @pagy, @quotations = pagy(Quotation.publicate)
  end
end

class DashboardController < ApplicationController
  def index
  end

  def properties
    @account = Account.find(params[:id])
    @properties = Property.where(account_id: @account.id)
  end

  def reports
  end
end

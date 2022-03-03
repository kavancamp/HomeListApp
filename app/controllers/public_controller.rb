class PublicController < ApplicationController
  def main
    if account_signed_in?
      redirect_to dashboard_path and return
    end
    @properties = Property.latest
  end
end

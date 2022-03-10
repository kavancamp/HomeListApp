class ProfileController < ApplicationController
    before_action :is_invalid_profile?
   
  
    def index   
        @account = Account.find(params[:id])
        @properties = Property.where(account_id: @account.id)
        @properties_for_sale = Property.where(account_id: @account.id).for_sale.count
        @properties_sold = Property.where(account_id: @account.id).sold.count
        @properties_leased = Property.where(account_id: @account.id).leased.count
        @properties_rent = Property.where(account_id: @account.id).for_rent.count
    end

    private
    def is_invalid_profile?
        @account = Account.find(params[:id])
        if @account.nil?
            redirect_to root_path, alert: "Profile not found" and return
        end
    end

  end
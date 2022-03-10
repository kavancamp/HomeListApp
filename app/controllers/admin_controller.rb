class AdminController < ApplicationController
  before_action :can_access?
  before_action :set_sidebar

  def accounts
    @accounts = Account.where(admin: false)
  end

  def can_access?
    unless current_account.admin?
      redirect_to root_url, flash: {danger: "Access Denied"}
    end
  end

end
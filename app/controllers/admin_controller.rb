class AdminController < ApplicationController
  
  def accounts
    @accounts = Account.where(admin: false)
  end

end

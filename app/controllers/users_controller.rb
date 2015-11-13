class UsersController < ApplicationController

  def show
  	@user = current_user
  end

  def reminder_settings
  	@user = current_user
  end

end

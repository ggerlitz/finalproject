class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

	def configure_permitted_parameters
	  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, 
                                                            :last_name, 
                                                            :phone, 
                                                            :email, 
                                                            :email_frequency,
                                                            :sms_frequency,
                                                            :last_email,
                                                            :last_sms,
                                                            :password
                                                            ) 
                                              }
	end

  def after_sign_in_path_for(resource)
  	@user
  end

  def last_email_reminder
    # last_email_reminder = last_email_sent - Time.now.days 
  end

  def last_sms_reminder
    # last_sms_reminder = last_sms_sent - Time.now.days 
  end




  def email_reminder
    UserMailer.welcome_email(current_user).deliver_later(wait: 1.week.from_now) 
    last_email_sent = Time.now
  end

  # def after_sign_up_path_for(resource)
  #   new_plan_path
  # end
end

class UserMailer < ApplicationMailer

	def welcome_email
		@current_user = current_user
	end

	def goal_reminder
	end

end

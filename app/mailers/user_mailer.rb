class UserMailer < ApplicationMailer

	def welcome_email(user)
		@current_user = user
		mail(to: user.email,
				from: "test@zest.com",
				subject:"EUREKA!",
		)
	end

	def goal_reminder
	end

end

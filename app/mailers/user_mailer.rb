class UserMailer < ApplicationMailer

	def explore_assessment_email(user)
		@current_user = user
		mail(to: user.email,
				from: "sproutadmin@sprout.com",
				subject:"Sprout Reminder",
		)
	end

	def goal_reminder
	end

end

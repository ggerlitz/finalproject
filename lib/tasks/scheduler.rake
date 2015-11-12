namespace :scheduler do
	desc "Send sms and email reminders to users at requested frequency"
	task :send_sms_reminder => :environment do
	  puts "Sending sms reminders..."
	  NewsFeed.update
	  puts "Send sms reminders completed."
	end
end

task :send_email_reminders => :environment do
  User.send_reminders
end
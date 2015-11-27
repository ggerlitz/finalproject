namespace :email_scheduler do
	desc "Send email reminders to users at requested frequency"
	task :send_emails, [:user] => :environment do
	  puts "Sending email reminders..."
    users = User.all
  	users.each do |user|
  		if user.needs_email? == true
        begin
          UserMailer.welcome_email(user).deliver_now
          user.update(last_emailed: Time.now)
        rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError, Net::SMTPFatalError, Net::SMTPUnknownError => e
          puts "Problem sending mail to #{user.email}"
        end
  		end
  	end
	  puts "Send email reminders completed."
	end
end

namespace :sms_scheduler do
	desc "Send sms reminders to users at requested frequency"
	task :send_texts => :environment do
		puts "Sending text reminders..."
		users = User.all
		user.each do |user|
			if user.needs_sms? == true 
		    twilio_number = ENV['TWILIO_NUMBER']
		    client = Twilio::REST::Client.new ENV['TWILIO_APP_TEST_KEY'], ENV['TWILIO_TEST_TOKEN']
		    client.messages.create(
		      from: twilio_number,
		      to: '+12489628305',
		      body: "Test",
		      media_url: '<%= user.motivations.shuffle.first.image_file_name %>' 
		    )    
		  end
		end
	  puts "Send texts completed"
  end  
end
class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	devise :omniauthable, :omniauth_providers => [:facebook]
  has_one :assessment
  has_many :motivations 
  
  def email_is_daily?
    email_frequency == 0
  end
  
  def email_is_weekly?
    email_frequency == 1    
  end

  def needs_email?
    (email_is_daily? and (Time.now - 1.day) > last_email) ||
    (email_is_weekly? and (Time.now - 7.day) > last_email)
  end  

  def reoccuring_email_reminder
  	for user in users do
  		if user.needs_email? == true
        begin
          UserMailer.welcome_email(user).deliver_now
          user.update(last_emailed: Date.new)
        rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError, Net::SMTPFatalError, Net::SMTPUnknownError => e
          puts "Problem sending mail to #{user.email}"
        end
  		end
  	end
  end

  def reoccuring_sms_reminder
  	# when_to_send =  user sets frequency day & time
    twilio_number = ENV['TWILIO_NUMBER']
    client = Twilio::REST::Client.new ENV['TWILIO_APP_TEST_KEY'], ENV['TWILIO_TEST_TOKEN']
    client.messages.create(
      from: twilio_number,
      to: '+1<%= current_user.phone %>',
      body: "Test",
      media_url: '<%= user.motivations.shuffle.first.image_file_name %>' 
    )    
  	# User.sms_reminder.perform_later
  	# app sends SMS those days and times
  end  

end
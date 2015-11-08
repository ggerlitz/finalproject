class TwilioController < ApplicationController

	def incoming
		from_number = params["From"].delete "+1"
		keyword_lookup = params["Body"]
		@user = User.find_by(phone: from_number).keyword_lookup
		response = Twilio::TwiML::Response.new do |r|
			if @user 
				r.sms @user
			else
				r.sms 'There was a problem.'
			end
		end
		render text: response.text
	end

end

# If user metions KEYWORDS (HELP, MOTIVATE ME, REMIND ME, ETC) it will send a specific msg 
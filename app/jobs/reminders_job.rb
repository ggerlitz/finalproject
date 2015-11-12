class RemindersJob < ActiveJob::Base
  queue_as :default

  def perform(user)
    twilio_number = ENV['TWILIO_NUMBER']
    client = Twilio::REST::Client.new ENV['TWILIO_APP_TEST_KEY'], ENV['TWILIO_TEST_TOKEN']
    client.messages.create(
      from: twilio_number,
      to: '+1<%= current_user.phone %>',
      body: "Test",
      media_url: '<%= user.motivations.shuffle.first.image_file_name %>' 
    )
  end
end

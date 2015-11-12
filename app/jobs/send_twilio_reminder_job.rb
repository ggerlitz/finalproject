class SendTwilioReminderJob < ActiveJob::Base
  queue_as :default

  def perform
    puts "I did it!"
  end
end

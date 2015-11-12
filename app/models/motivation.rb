class Motivation < ActiveRecord::Base
	belongs_to :user
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  after_create :sms_reminder


  # handle_asynchronously :reminder, :run_at => Proc.new { 1.minutes.from_now }
  # send at user's requested frequency

end

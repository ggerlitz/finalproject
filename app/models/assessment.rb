class Assessment < ActiveRecord::Base
belongs_to :user
validates_presence_of :body

after_create :email_reminder


end
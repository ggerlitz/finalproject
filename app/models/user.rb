class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	devise :omniauthable, :omniauth_providers => [:google_oauth2]
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

  def sms_is_daily?
    sms_frequency == 0
  end
  
  def sms_is_weekly?
    sms_frequency == 1    
  end

  def needs_sms?
    (sms_is_daily? and (Time.now - 1.day) > last_email) ||
    (sms_is_weekly? and (Time.now - 7.day) > last_email)
  end  

end
class UserMailer < ActionMailer::Base

  def request_notification(user)
    setup_email(user)
    @subject    += "You've requested for registration."
  end
  
  def approve_notification(user)
    setup_email(user)
    @subject    += 'Registration request.'
    @url  = "http://ghapp.heroku.com/signup"
  end

  def signup_notification(user)
    setup_email(user)
    @subject    += 'Signup successful.'
    @url  = "http://ghapp.heroku.com/activate/#{user.activation_code}"
  end
  
  def activation(user)
    setup_email(user)
      @subject    += 'Your account has been activated!'
      @url  = "http://ghapp.heroku.com/"
  end
  
  protected

  def setup_email(user)
    @recipients  = "#{user.email}"
    @from        = "ADMINEMAIL"
    @subject     = "[GRApp] "
    @sent_on     = Time.now
    @user = user
  end

end

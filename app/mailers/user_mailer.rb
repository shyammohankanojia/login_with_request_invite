class UserMailer < ActionMailer::Base

  def signup_notification(user)
    setup_email(user)
    @subject    += 'Registration successful.'
#      @url  = "http://YOURSITE/activate/#{user.activation_code}"
  end
  
  def activation(user)
    setup_email(user)
#@subject    += 'Your account has been activated!'
    @subject    += 'Please activate your new account'
       @url  = "http://ghapp.heroku.com/activate/#{user.activation_code}"
#@url  = "http://YOURSITE/"
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

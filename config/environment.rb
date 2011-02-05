# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Site::Application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,
  :address            => 'smtp.gmail.com',
  :port               => 587,
  :tls                  => true,
  :domain             => 'gmail.com', #you can also use google.com
  :authentication     => :plain,
  :user_name          => 'shyammohankanojia@gmail.com',
  :password           => 'shrity_sharma'
}


# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

Time::DATE_FORMATS[:expire] = "Expira em %d/%m/%Y"

require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
Bundler.require(:default, Rails.env) if defined?(Bundler)
module Musicbook1
  class Application < Rails::Application
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
 
    AWS::S3::Base.establish_connection!(
      :access_key_id     => '',
      :secret_access_key => ''
    )
    BUCKET = 'songholder'
    AWS::S3::DEFAULT_HOST.replace "s3-us-west-2.amazonaws.com"
  end
end


    
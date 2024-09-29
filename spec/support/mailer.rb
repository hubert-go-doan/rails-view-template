# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:each) do
    # TODO: temporary disabled
    # ActionMailer::Base.deliveries.clear
  end
end

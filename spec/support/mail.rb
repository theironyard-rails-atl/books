RSpec.configure do |config|
  config.before :each, mail: true do
    ActionMailer::Base.deliveries.clear
  end
end

# slack_api_wrapper_test.rb
require_relative 'test_helper'

describe SlackApiWrapper do
  it "can send a valid message" do
    VCR.use_cassette("slack-posts") do
      response = SlackApiWrapper.send_msg("Posting with ruby!", "general")
      expect(response).must_equal true
    end
  end
end

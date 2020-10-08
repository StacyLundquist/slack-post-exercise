# slack_api_wrapper.rb
require 'httparty'

module SlackApiWrapper
  BASE_URL = 'https://slack.com/api'
  API_KEY = ENV['SLACK_TOKEN']

  def self.send_msg(message, channel)
    response = HTTParty.post(
      "#{BASE_URL}/chat.postMessage",
      body: {
        token: API_KEY,
        text: message,
        channel: channel
      },
      headers: { 'Content-Type' => 'application/x-www-form-urlencoded' }
    )

    if response.code != 200 || response["ok"] == false
      raise StandardError, "there is a problem: #{response['error']}"
    end
    return response.code == 200 && response.parsed_response['ok']

  end

end

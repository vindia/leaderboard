require 'httparty'
require 'json'

class Ducksboard
  attr_accessor :api_key

  def initialize(api_key)
    @api_key = api_key
  end

  def push(widget, body = {})
    options = { body: body.to_json, basic_auth: {username: @api_key, password: 'x'}, content_type: 'application/json' }
    response = HTTParty.post("https://push.ducksboard.com/values/#{widget}", options)

    return true if response.code.to_i == 200
    raise "Invalid request: #{response.code} #{response.message}"
  end
end
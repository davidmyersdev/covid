require 'bundler/setup'
require 'dotenv/load'
require 'httparty'
require 'rubygems'
require 'twitter'

response = HTTParty.get('https://corona.lmao.ninja/states')
ohio = response.parsed_response.find { |item| item['state'] == 'Ohio' }

abort 'Ohio not found' unless ohio

cases = ohio['cases']
deaths = ohio['deaths']
recovered = ohio['recovered']

abort 'ohio[cases] missing' if cases.nil?
abort 'ohio[deaths] missing' if deaths.nil?

client = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV['CONSUMER_KEY']
  config.consumer_secret = ENV['CONSUMER_SECRET']
  config.access_token = ENV['ACCESS_TOKEN']
  config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
end

client.update <<~TWEET
  [Automated] Ohio COVID update.

  Cases: #{cases}
  Recovered: #{recovered}
  Deaths: #{deaths}
TWEET

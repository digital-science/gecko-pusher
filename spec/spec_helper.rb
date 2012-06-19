require 'gecko-pusher'
require 'webmock/rspec'
require 'json'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
end

API_KEY = "187249817294871"
WIDGET_KEY = "rag_widget"

def stub_gecko_post(widget_key, data)
  url = "https://push.geckoboard.com/v1/send/#{widget_key}"
  stub_request(:post, url).
    with(
      :body => {
        api_key: API_KEY,
        data: data
      }.to_json,
      :headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
    to_return(:status => 200, :body => "", :headers => {})
end

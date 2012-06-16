# Gecko::Pusher

Provides a simple library to send updates to GeckoBoard via its push API

## Installation

Add this line to your application's Gemfile:

    gem 'gecko-pusher'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gecko-pusher

## Usage

### Configure your API key

Gecko::Pusher.api_key = <your api key>

or set the following environment variable - Gecko::Pusher will pick it up

GECKO_PUSHER_APIKEY = <your api key>

### Setting up a channel

channel = Gecko::Pusher::Channel.new('widget_key', :linechart)

Second parameter options:

:text
:map
:number
:rag
:ragcol
:linechart
:piechart
:geckometer
:funnel
:bullet

Creating a channel with an missing or invalid type will cause an ArgumentError to be raised.

### Sending a message to a channel

Simple. Call push on the channel with a Ruby hash that matches the expected payload for the channel, as specified at http://docs.geckoboard.com/api/custom-widgets.html (for widgets) and http://docs.geckoboard.com/api/custom-charts.html (for charts).
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

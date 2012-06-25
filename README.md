# Gecko::Pusher

Provides a simple library to send updates to GeckoBoard via its push API

PLEASE NOTE: at present this README is a spec - the library does not implement all these features yet.

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

    channel = Gecko::Pusher.channel(:text, "<your widget key>")

First parameter options:

    :text
    :map
    :number
    :rag
    :rag_col
    :line_chart
    :pie_chart
    :gecko_meter
    :funnel
    :bullet

Creating a channel with an missing or invalid type will cause an ArgumentError to be raised.

### Text

Creating a channel returns an object that makes it easy to send messages to Geckoboard without having to manually create the JSON. Rather, the push method will parse your args in (hopefully) a manner that makes sense. So, text widgets (when you use the :text option) will understand the following:

    channel.push("Message")                                         // Single plain message
    channel.push(Gecko::Pusher::TEXT_ALERT, "Message")              // Single alert message
    channel.push("One", "Two", "Three")                             // Multiple plain messages
    channel.push(Gecko::Pusher::TEXT_ALERT, "One", "Two", "Three")  // Muliple alert messages
    channel.push(
      [ Gecko::Pusher::TEXT_ALERT, "One", "Two" ],
      [ Gecko::Pusher::TEXT_INFO, "Three", "Four" ],
      [ "Five", "Six"]
    )                                                               // Multiple different message types, one type per array (default: Gecko::Pusher::TEXT_PLAIN)

### RAG widgets

    channel.push(100, 200, 300)                                   // Pushes RAG values with no description
    channel.push(100, "desc", 222, "desc", 300 "desc")            // Push RAG values with descriptions
    channel.push(:green, 100)                                     // Just push a green value
    channel.push(:green, 100, "Description")                      // Push a green value with a description

### Line charts

    channel.push([1,2,3,4,5])                                       // Push raw values, no settings
    channel.push([1,2,3,4,5], colour: "#FF0000")                    // Push values with colour set
    channel.push([1,2,3,4,5], colour: "#FF0000", axisx: ['1','2'])  // Push values with colour and X-axis labels set

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes with specs to ensure resilience to regressions (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

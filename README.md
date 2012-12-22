resque-honeybadger
==================

resque-honeybadger provides a [Resque][re] failure backend that sends exceptions raised by jobs to [honeybadger.io][hb].

Install & Quick Start
---------------------

Before you jump into code, you'll need a honeybadger.io account.

Add this line to your application's Gemfile:

    gem 'resque-honeybadger'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install resque-honeybadger


### Example

Using only the honeybadger failure backend:

    # Suggested file in Rails: config/initializers/resque.rb

    require 'resque'
    require 'resque-honeybadger'

    # If you don't already do `Honeybadger.configure` elsewhere.
    Resque::Failure::Honeybadger.configure do |config|
      config.api_key = 'abc123'  # Your key here.
    end

    Resque::Failure.backend = Resque::Failure::Honeybadger

Using both the redis and honeybadger failure backends:

    require 'resque'
    require 'resque-honeybadger'

    require 'resque/failure/multiple'
    require 'resque/failure/redis'

    # If you don't already do `Honeybadger.configure` elsewhere.
    Resque::Failure::Honeybadger.configure do |config|
      config.api_key = 'abc123'  # Your key here.
    end

    Resque::Failure::Multiple.classes = [Resque::Failure::Redis, Resque::Failure::Honeybadger]
    Resque::Failure.backend = Resque::Failure::Multiple


Forked by
------

Henrik Nyh :: <http://henrik.nyh.se> :: @henrik
Jacques Crocker :: <http://railsjedi.com> :: @railsjedi


Original Author
------

Luke Antins :: [http://lividpenguin.com][lp] :: @lantins

[re]: http://github.com/defunkt/resque
[lp]: http://lividpenguin.com
[hb]: http://honeybadger.io

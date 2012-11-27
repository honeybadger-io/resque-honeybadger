resque-honeybadger
==================

resque-honeybadger provides a [Resque][re] failure backend that sends exceptions
raised by jobs to [honeybadger.io][hb]

Install & Quick Start
---------------------

Before you jump into code, you'll need a honeybadger.io account.

To install:

    $ gem install resque-honeybadger

### Example: Single Failure Backend

Using only the honeybadger failure backend:

    require 'resque'
    require 'resque-honeybadger'

    Resque::Failure::Honeybadger.configure do |config|
      config.api_key = '505f2518c41866bb0be7ba434bb2b079'
    end

    Resque::Failure.backend = Resque::Failure::Honeybadger

### Example: Multiple Failure Backends

Using both the redis and honeybadger failure backends:

    require 'resque'
    require 'resque-honeybadger'

    require 'resque/failure/multiple'
    require 'resque/failure/redis'

    Resque::Failure::Honeybadger.configure do |config|
      config.api_key = '505f2518c41866bb0be7ba434bb2b079'
    end

    Resque::Failure::Multiple.classes = [Resque::Failure::Redis, Resque::Failure::Honeybadger]
    Resque::Failure.backend = Resque::Failure::Multiple

Configuration Options
---------------------

**Required**

  * `api_key` - your honeybadger.io api key.


Note on Patches/Pull Requests
-----------------------------

  * Fork the project.
  * Make your feature addition or bug fix.
  * Add tests for it. This is important so I don't break it in a future
    version unintentionally.
  * Commit, do not mess with the version. (if you want to have your own
    version, that is fine but bump version in a commit by itself I can ignore
    when I pull)
  * Send me a pull request. Bonus points for topic branches.


Forked by
------

Jacques Crocker :: <http://railsjedi.com> :: @railsjedi


Original Author
------

Luke Antins :: [http://lividpenguin.com][lp] :: @lantins

[re]: http://github.com/defunkt/resque
[lp]: http://lividpenguin.com
[hb]: http://honeybadger.io
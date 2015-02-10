spec = Gem::Specification.new do |s|
  s.name              = 'resque-honeybadger'
  s.version           = '1.0.3'
  s.date              = Time.now.strftime('%Y-%m-%d')
  s.summary           = 'A Resque failure backend for Honeybadger.'
  s.homepage          = 'http://github.com/honeybadger-io/resque-honeybadger'
  s.authors           = ['Luke Antins', 'Jacques Crocker', 'Henrik Nyh', 'Joshua Wood']
  s.email             = 'support@honeybadger.io'
  s.has_rdoc          = false

  s.files             = %w(LICENSE Rakefile README.md HISTORY.md)
  s.files            += Dir.glob('{test/*,lib/**/*}')
  s.require_paths     = ['lib']

  s.add_dependency('resque', '>= 1.8.0')
  s.add_dependency('honeybadger')

  s.description       = <<-EOL
    Provides a Resque failure backend that sends exceptions raised by jobs to the Honeybadger service.
  EOL
end

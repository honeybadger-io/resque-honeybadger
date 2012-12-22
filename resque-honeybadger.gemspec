spec = Gem::Specification.new do |s|
  s.name              = 'resque-honeybadger'
  s.version           = '1.0.0'
  s.date              = Time.now.strftime('%Y-%m-%d')
  s.summary           = 'A Resque failure backend for honeybadger.io'
  s.homepage          = 'http://github.com/lantins/resque-honeybadger'
  s.authors           = ['Jacques Crocker']
  s.email             = 'railsjedi@gmail.com'
  s.has_rdoc          = false

  s.files             = %w(LICENSE Rakefile README.md HISTORY.md)
  s.files            += Dir.glob('{test/*,lib/**/*}')
  s.require_paths     = ['lib']

  s.add_dependency('resque', '>= 1.8.0')
  s.add_dependency('honeybadger')

  s.description       = <<-EOL
    resque-honeybadger provides a Resque failure backend that sends exceptions
    raised by jobs to honeybadger.io.
  EOL
end

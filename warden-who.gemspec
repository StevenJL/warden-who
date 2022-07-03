Gem::Specification.new do |s|
  s.name        = 'warden-who'
  s.version     = '0.0.1'
  s.summary     = "A warden extension to track signed in users"
  s.description = "A warden extension to track signed in users"
  s.authors     = ["Steven Li"]
  s.email       = 'StevenJLi@gmail.com'
  s.files       = ["lib/warden_who.rb"]
  s.add_runtime_dependency "warden"
  s.add_runtime_dependency "redis"
  s.homepage    =
    'https://github.com/StevenJL/warden-who'
  s.license       = 'GPL v3'
end

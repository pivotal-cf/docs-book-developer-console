# Redirect all production http traffic to https
r301 %r{.*}, 'https://docs.pivotal.io$&', :if => Proc.new { |rack_env|
  rack_env['SERVER_NAME'] == 'docs.pivotal.io' && rack_env['HTTP_X_FORWARDED_PROTO'] == 'http'
}

# All version numbered docs go to alpha
r301 %r{/developer-console/([\d-]+)/(.*)}, "/developer-console/0-alpha/$2"

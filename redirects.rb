# Redirect all production http traffic to https
r301 %r{.*}, 'https://docs.pivotal.io$&', :if => Proc.new { |rack_env|
  rack_env['SERVER_NAME'] == 'docs.pivotal.io' && rack_env['HTTP_X_FORWARDED_PROTO'] == 'http'
}

# Redirect from docs.pivotal.io/developer-console/ to docs.vmware.com Developer Console PDF

r301  %r{/developer-console/0-alpha}, "https://docs.vmware.com/en/Developer-Console/Alpha/developer-console.pdf"

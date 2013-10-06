case node['platform_bamily']
when 'smartos'
  default['sudo']['prefix'] = '/opt/local/etc'
else
  default['sudo']['prefix'] = '/etc'
end
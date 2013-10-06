default['sudo']['package'] = 'sudo'

case node['platform_family']
when 'smartos'
  default['sudo']['prefix'] = '/opt/local/etc'
else
  default['sudo']['prefix'] = '/etc'
end

default['sudo']['groups'] = []
default['sudo']['users'] = [node['uncrate']['user']]
default['sudo']['nopasswd']  = false
default['sudo']['include_sudoers_d'] = false
default['sudo']['agent_forwarding'] = false
default['sudo']['sudoers_defaults'] = []


case node['platform']
when 'ubuntu'
  if node['platform_version'].to_f >= 12.04
    default['sudo']['sudoers_defaults'] = [
      'env_reset',
      'secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"'
    ]
  elsif node['platform_version'].to_f >= 10.04
  	default['sudo']['sudoers_defaults'] = ['env_reset']
  end

  default['sudo']['groups'] = ['sudo']
when 'osx'
end

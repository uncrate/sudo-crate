return if skip_unsupported_platform

case node['platform']
when "ubuntu"
  package "sudo" do
    package_name node['sudo']['package']
  end
end

template "#{node['sudo']['prefix']}/sudoers" do
  source 'sudoers.erb'
  mode   '0440'
  owner  'root'
  group  platform?('freebsd') ? 'wheel' : 'root'
  variables(
    :sudoers_defaults  => node['sudo']['sudoers_defaults'],
    :sudoers_groups    => node['sudo']['groups'],
    :sudoers_users     => node['sudo']['users'],
    :nopasswd      => node['sudo']['nopasswd'],
    :include_sudoers_d => node['sudo']['include_sudoers_d'],
    :agent_forwarding  => node['sudo']['agent_forwarding']
  )
end

name             'sudo-crate'
maintainer       'John Leacox'
license          'Apache 2.0'
description      'Configures sudoers'
version          '0.1.0'

%w{
  ubuntu
}.each do |os|
  supports os
end

depends 'uncrate_base'
depends 'sudo'

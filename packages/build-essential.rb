# Special package, anything that defines a 'source' package means build-essential should be installed for Ubuntu

package :build_essential do
  description 'Build tools'
  apt 'build-essential' do
    pre :install, 'apt-get update'
  end

  apt 'bash' do
    # Make sure we are running a Bash shell
    post :install, 'ln -sf /bin/bash /bin/sh'
  end

  verify do
    has_executable 'gcc'
    has_executable 'g++'
    has_executable '/bin/bash'
    has_symlink    '/bin/sh', '/bin/bash'
  end

  requires :apt_sources
end

package :apt_sources do
  description 'Update apt-get sources list'
  noop do
    pre :install, 'sudo rm -f /etc/apt/sources.list && sudo touch /etc/apt/sources.list'
  end
  
  push_text File.read("#{File.dirname(__FILE__)}/../configurations/apt"), '/etc/apt/sources.list', :sudo => true
end

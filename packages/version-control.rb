package :git, :provides => :version_control do
  description 'Git Version Control System'

  apt 'git-core'

  verify do
    has_executable 'git'
  end
end

package :svn, :provides => :version_control do
  description 'Subversion Version Control System'
  
  apt 'subversion'
  
  verify do
    has_executable 'svn'
  end
end

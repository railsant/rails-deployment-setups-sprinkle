package :settings do
  noop do
    pre :install, "echo '' > ~/.vimrc"
  end

  push_text File.read("#{File.dirname(__FILE__)}/../configurations/vimrc"), '~/.vimrc', :sudo => true

  verify do
    has_file '~/.vimrc'
  end
end

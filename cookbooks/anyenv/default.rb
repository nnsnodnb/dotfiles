brew 'anyenv'

execute "/bin/bash -lc 'yes | /Users/#{node[:user]}/.anyenv/bin/anyenv install --init'" do
  not_if "test -d /Users/#{node[:user]}/.config/anyenv/anyenv-install"
end

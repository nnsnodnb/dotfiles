brew 'vim'

remote_file "#{ENV['HOME']}/.vimrc" do
  source 'files/.vimrc'
  owner node[:user]
  group node[:group]
  not_if "test -e #{ENV['HOME']}/.vimrc"
end

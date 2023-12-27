brew 'vim'

remote_file "/Users/#{node[:user]}/.vimrc" do
  source 'files/.vimrc'
  owner node[:user]
  group node[:group]
end

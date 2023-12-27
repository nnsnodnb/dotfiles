remote_file "/Users/#{node[:user]}/.zshrc" do
  source 'files/.zshrc'
  owner node[:user]
  group node[:group]
end

if node[:user] == "nnsnodnb"
  remote_file '/Users/nnsnodnb/.gitconfig' do
    source 'files/.gitconfig'
    not_if 'test -f /Users/nnsnodnb/.gitconfig'
  end
end

remote_file "/Users/#{node[:user]}/.gitignore_global" do
  source 'files/.gitignore_global'
end

file "/Users/#{node[:user]}/.gemrc" do
  content 'gem: -N'
end

directory "/Users/#{node[:user]}/.ssh" do
  mode '700'
  owner node[:user]
  group node[:group]
  not_if "test -d /Users/#{node[:user]}/.ssh"
end

remote_file "/Users/#{node[:user]}/.ssh/config" do
  source 'files/ssh_config'
  not_if "test -f /Users/#{node[:user]}/.ssh/config"
end

execute 'Change mode' do
  command "chmod 600 /Users/#{node[:user]}/.ssh/config"
end

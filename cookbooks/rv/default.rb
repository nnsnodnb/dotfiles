execute 'curl -LsSf https://rv.dev/install | sh' do
  not_if "test -d /Users/#{node[:user]}/.local/bin/rv"
end

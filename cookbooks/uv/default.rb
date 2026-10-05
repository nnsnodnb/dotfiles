execute 'curl -LsSf https://astral.sh/uv/install.sh | sh' do
  not_if "test -d /Users/#{node[:user]}/.local/bin/uv"
end

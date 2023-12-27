define :brew do
  name = params[:name]

  execute "brew install #{name}" do
    not_if "test -d /opt/homebrew/Cellar/#{name}"
  end
end

define :cask do
  name = params[:name]

  execute "brew install --cask #{name}" do
    not_if "test -d /opt/homebrew/Caskroom/#{name} -o -x /opt/homebrew/bin/#{name}"
  end
end

define :tap do
  execute "brew tap #{params[:name]}" do
    user, repository = params[:name].split('/')
    not_if "test -d /opt/homebrew/Library/Taps/#{user}/homebrew-#{repository}"
  end
end

define :anyenv do
  name = params[:name]

  execute "/bin/bash -lc \"$(brew --prefix)/bin/anyenv install #{name}\"" do
    not_if "test -d /Users/#{node[:user]}/.anyenv/envs/#{name}"
  end
end

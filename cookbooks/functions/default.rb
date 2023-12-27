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

define :anyenv do
  name = params[:name]

  execute "anyenv install #{name}" do
    not_if "test -d #{ENV["HOME"]}/.anyenv/envs/#{name}"
  end
end

define :cask do
  name = params[:name]

  execute "brew install --cask #{name}" do
    not_if "brew list --cask #{name}"
  end
end

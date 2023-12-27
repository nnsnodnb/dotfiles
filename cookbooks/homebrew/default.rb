execute 'brew update' do
  only_if 'brew doctor'
end

execute '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"' do
  not_if 'which brew'
end

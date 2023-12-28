cask 'google-chrome'

execute 'Make default browser' do
  command 'open -a "Google Chrome.app" --args --make-default-browser'
end

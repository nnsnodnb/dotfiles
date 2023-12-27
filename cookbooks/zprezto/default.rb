execute 'Update zprezto' do
  command "cd /Users/#{node[:user]}/.zprezto && git pull && git submodule update --init --recursive && cd -"
  not_if "! test -d /Users/#{node[:user]}/.zprezto"
end

git "/Users/#{node[:user]}/.zprezto" do
  repository 'https://github.com/sorin-ionescu/prezto.git'
  recursive true
  not_if "test -d /Users/#{node[:user]}/.zprezto"
end

execute 'Configure setting files' do
  command 'zsh -c \'setopt EXTENDED_GLOB && for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md\(.N\); do ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"; done\''
end

remote_file "/Users/#{node[:user]}/.zprezto/runcoms/zpreztorc" do
  source 'files/.zpreztorc'
end

execute 'Download prompt_powerline_setup' do
  command "curl https://raw.github.com/davidjrice/prezto_powerline/master/prompt_powerline_setup > /Users/#{node[:user]}/.zprezto/modules/prompt/functions/prompt_powerline_setup"
end

directory '/tmp/fonts' do
  mode '755'
  owner node[:user]
  group node[:group]
end

git '/tmp/fonts' do
  repository 'https://github.com/powerline/fonts.git'
  depth 1
end

execute 'Install fonts' do
  command 'cd /tmp/fonts && ./install.sh && cd - && rm -rf /tmp/fonts'
end

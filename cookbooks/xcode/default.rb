if node[:user] != 'runner'
  execute 'Download Xcode.xip' do
    command "curl -o /tmp/Xcode.xip https://download.developer.apple.com/Developer_Tools/Xcode_15.1/Xcode_15.1.xip"
    not_if 'ls /Applications | grep -E \'^Xcode(_)?(\d)*(\..*)?(beta)?(\d)?\.app$\''
  end

  execute 'Unzip Xcode.xip' do
    command 'xip -x /tmp/Xcode.xip -C /Applications && rm /tmp/Xcode.xip'
    only_if 'test -f /tmp/Xcode.xip'
  end
end

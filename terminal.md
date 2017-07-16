## terminal access shadowsocks
on MacOs
brew install polipo
ln -sfv /usr/local/opt/polipo/*.plist ~/Library/LaunchAgents
vim /usr/local/opt/polipo/homebrew.mxcl.polipo.plist
// (add <string>socksParentProxy=localhost:8713</string>)
launchctl unload /usr/local/Cellar/polipo/1.1.1/homebrew.mxcl.polipo.plist
launchctl load /usr/local/Cellar/polipo/1.1.1/homebrew.mxcl.polipo.plist 

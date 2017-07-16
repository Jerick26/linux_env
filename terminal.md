## terminal access shadowsocks
[http://droidyue.com/blog/2016/04/04/set-shadowsocks-proxy-for-terminal/index.html]
### on MacOs<br>
```
brew install polipo
ln -sfv /usr/local/opt/polipo/*.plist ~/Library/LaunchAgents
vim /usr/local/opt/polipo/homebrew.mxcl.polipo.plist
// (add <string>socksParentProxy=localhost:8713</string>)
launchctl unload /usr/local/Cellar/polipo/1.1.1/homebrew.mxcl.polipo.plist
launchctl load /usr/local/Cellar/polipo/1.1.1/homebrew.mxcl.polipo.plist 
```
### test
```
http_proxy=http://localhost:1087 curl ip.gs
alias hp="http_proxy=http://localhost:1087"
hp curl ip.gs

export http_proxy=http://localhost:1087
unset http_proxy
```
### git proxy
```
git clone https://android.googlesource.com/tools/repo --config http.proxy=localhost:1087
in .bashrc or .bash_profile add `gp=" --config http.proxy=localhost:8123"`
git clone  https://android.googlesource.com/tools/repo $gp
```

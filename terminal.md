## terminal access shadowsocks
[http://blog.csdn.net/u014015972/article/details/50647019]
[http://droidyue.com/blog/2016/04/04/set-shadowsocks-proxy-for-terminal/index.html]
### on MacOs<br>
```
brew install polipo
ln -sfv /usr/local/opt/polipo/*.plist ~/Library/LaunchAgents
vim /usr/local/opt/polipo/homebrew.mxcl.polipo.plist
// (add <string>socksParentProxy=localhost:1080</string>)
launchctl unload /usr/local/Cellar/polipo/1.1.1/homebrew.mxcl.polipo.plist
launchctl load /usr/local/Cellar/polipo/1.1.1/homebrew.mxcl.polipo.plist 
```
### test
```
http_proxy=http://localhost:1087 curl ip.gs
alias hp="http_proxy=http://localhost:1087"
hp curl ip.gs

export http_proxy=http://localhost:1087 # shadowsocks proxy port
# if need login, use: http_proxy=http://userName:password@proxyAddress:port
unset http_proxy

in .bash_profile
export http_proxy=http://127.0.0.1:1087
export https_proxy=http://127.0.0.1:1087
```
### git proxy
`vi .gitconfig`
```
[http]                                                                          
› proxy = http://127.0.0.1:1087                                                 
[https]                                                                         
› proxy = http://127.0.0.1:1087
```

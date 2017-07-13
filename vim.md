## vimdiff
do, diff obtain
dp, diff put
]c, next diff
[c, previous diff
:diffu[pdate], update files modified

## colorsheme
set background=light or dark<br/>
:colorscheme molokai/desert/peaksea/solarized/koehler/slate/evening/torte/default

## digraphs
doc: [http://vimdoc.sourceforge.net/htmldoc/digraph.html]<br/>
show all unicode characters<br/>
`:digraphs`<br/>
input a digraphs in insert mode<br/>
`CTRL-K {char1} {char2}`


## key map
map, remap, iremap, inoremap<br/>
doc: [http://haoxiang.org/2011/09/vim-modes-and-mappin/]<br/>
```
:verbose imap <C-k><br/>
:iremap <C-a> <C-k><br/>
:inoremap <C-a> <C-k>  # no remap in insert mode<br/>
:unmap <C-k>   # normal mode<br/>
:iunmap <C-k>  # insert mode<br/>
```

## vimdiff
do, diff obtain<br/>
dp, diff put<br/>
]c, next diff<br/>
[c, previous diff<br/>
:diffu[pdate], update files modified<br/>

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
:verbose imap <C-k>
:iremap <C-a> <C-k>
:inoremap <C-a> <C-k>  # no remap in insert mode
:unmap <C-k>   # normal mode
:iunmap <C-k>  # insert mode
```

## vimdiff
do, diff obtain
dp, diff put
]c, next diff
[c, previous diff
:diffu[pdate], update files modified

## colorsheme
set background=light or dark
:colorscheme molokai/desert/peaksea/solarized/koehler/slate/evening/torte/default

## digraphs
doc: [http://vimdoc.sourceforge.net/htmldoc/digraph.html]
show all unicode characters
`:digraphs`
input a digraphs in insert mode
`CTRL-K {char1} {char2}`


## key map
map, remap, iremap, inoremap
doc: [http://haoxiang.org/2011/09/vim-modes-and-mappin/]
:verbose imap <C-k>
:iremap <C-a> <C-k>
:inoremap <C-a> <C-k>  # no remap in insert mode
:unmap <C-k>   # normal mode
:iunmap <C-k>  # insert mode

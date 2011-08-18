set path+=/home/tuttle/bin
set modeline

" Moving
set whichwrap=h,l,~,[,]

" Indentation 
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set foldlevelstart=99 "All folds open
filetype indent on

set showbreak=++

"Syntax
let python_hightlight_all=1
syntax on
filetype on

set nu

set hlsearch
set ignorecase
set nowrap
set backupdir=~/.backup,.,/tmp
set directory=~/.backup,.,/tmp
set showcmd

set go=aegim
set gfn=Inconsolata\ Medium\ 12

"Window Options
set wmh=0

"Easy window switching 
nnoremap <F6> :cn<CR>
nnoremap <S-F6> :cp<CR>
nnoremap + <C-W>+
nnoremap - <C-W>-
"Open next buffer in horiz. split
nnoremap <F7> <C-W>s<C-W>j:bn<CR>
"Move and maximize
nnoremap <C-J> <C-W>j<C-W>_
nnoremap <C-K> <C-W>k<C-W>_
"Other keybindings
nnoremap <CR> :nohlsearch<CR>/<BS><CR> 
nnoremap <C-F9> :!~/bin/grepall<C-R><C-A> 
nnoremap <silent> <F9> :TlistToggle<CR>
let Tlist_Inc_Winwidth=0

"Search for visually selected term
vmap * /<C-R>*<CR>
vmap <C-M> :s/\(<C-R>*\)/\$\1\$/<CR>

"Filename completion
set wildignore=*.pyc,*.o,tags
set wildmode=longest:full
set wildmenu

autocmd FileType html,css set noexpandtab tabstop=2
autocmd FileType python set omnifunc=pythoncomplete#Complete

" Execute some commands when started from within mutt
" q saves and exits, as if it were the pager in mutt
autocmd FileType mail :nmap q :wq<CR>
" Mail should wrap at 72 characters and be spelled nicely.
" Also, start writing after headers
autocmd FileType mail :set wrap| :set tw=72| :set spell| :normal }
autocmd FileType mail :s/\n/\r/| :startinsert

au BufRead,BufNewFile *.hx setfiletype javascript
au BufNewFile,BufRead *.clj setfiletype clojure

" Go to beginning of line, count 72 characters, go back to previous space
" and insert a newline
colorscheme default 

"Indentation and spacing rules for Python and C
source /home/tuttle/.vim/pep78.vimrc

highlight ExtraWhitespace ctermbg=lightgray guibg=lightgray
match ExtraWhitespace /\s\+$/

"Print Options
set printoptions="header:0,paper:letter"

ab grepall !~/bin/grepall 
ab ack !~/bin/ack-grep

augroup mkd
autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
augroup END

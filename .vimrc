set nocompatible          " We're running Vim, not Vi!
syntax on                 " Enable syntax highlighting
colorscheme vividchalk 

:set wildmenu
:set wildmode=list:longest
:set clipboard=unnamed

" Make ',e' (in normal mode) give a prompt for opening files
" in the same dir as the current buffer's file.
if has("unix")
  map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
else
  map ,e :e <C-R>=expand("%:p:h") . "\\" <CR>
endif

au Bufread,BufNewFile *.feature set filetype=gherkin
au! Syntax gherkin source ~/.vim/syntax/cucumber.vim

if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
map! <S-Insert> <MiddleMouse>
map ,e :e =expand("%:p:h") . "/" 
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
map <S-Insert> <MiddleMouse>
let &cpo=s:cpo_save
unlet s:cpo_save
set backspace=indent,eol,start
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set guifont=Liberation\ Mono\ 8
set helplang=en
set mouse=a
set printoptions=paper:letter
set ruler
set nu
set runtimepath=~/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim72,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after
set softtabstop=2
set tabstop=2
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set termencoding=utf-8
set wildmenu
set wildmode=list:longest
set window=54

if has("unix")
	noremap <F5> :only<CR>:w<CR>:!ruby -Ispec:test '%' 2>&1 \| tee ~/tmp/.rubyrun.out<CR>:sp ~/tmp/.rubyrun.out<CR><CR>
else
	noremap <F5> :only<CR>:w<CR>:!ruby -Ispec:test '%' > "<C-R>=expand($HOME)<CR>/tmp/.rubyrun.out"<CR>:sp ~/tmp/.rubyrun.out<CR><CR>
endif

:noremap z :s/^/#<CR><Down>
:noremap Z :s/^\s*\(#\)//<CR><Down>

" vim: set ft=vim :
  " test line

" Highlight extraneous whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

" Can clear out all crazy extra whitespace in a file
:map ,s :%s/\s\+$//<CR>

" Format entire buffer with indents
:map ,. mzggvG='z

"Buffer next,previous
:noremap  :bn
:noremap  :bp
"
"Buffer delete
:noremap  :bd

" Remap F1 to be 'write' instead of 'help', because I keep bumping it
:map <F1> :w<CR>
" Remap F2 to be 'write', just like any good editor
:map <F2> :w<CR>

" Activate and process ftplugin scripts
:filetype off
:filetype plugin on
:filetype indent on

" Key abbreviations
iabbr _rv <%= -%><LEFT><LEFT><LEFT><LEFT>
iabbr _rc <% -%><LEFT><LEFT><LEFT><LEFT>


syntax on
colorscheme molokai
set t_Co=256

set autoindent
set smartindent
set expandtab
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,utf-8,ucs-2,cp932,sjis
set tabstop=2
set shiftwidth=2
set cursorline
set colorcolumn=80,120
highlight ColorColumn guibg=#202020 ctermbg=lightgray
set number
set showmode
set showmatch
set title
set backspace=indent,eol,start
set inccommand=split
set imdisable
set laststatus=2
set statusline=
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=\ %n\           " buffer number
set statusline+=%#Visual#       " colour
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=%#CursorIM#     " colour
set statusline+=%R                        " readonly flag
set statusline+=%M                        " modified [+] flag
set statusline+=%#Cursor#               " colour
set statusline+=%#CursorLine#     " colour
set statusline+=\ %t\                   " short file name
set statusline+=%=                          " right align
set statusline+=%#CursorLine#   " colour
set statusline+=\ %Y\                   " file type
set statusline+=%#CursorIM#     " colour
set statusline+=\ %3l:%-2c\         " line + column
set statusline+=%#Cursor#       " colour
set statusline+=\ %3p%%\                " percentage
set hidden
set nobackup
set nowritebackup
set conceallevel=0

let g:vim_json_syntax_conceal = 0

" htmlのマッチするタグに%でジャンプ
source $VIMRUNTIME/macros/matchit.vim

hi Comment ctermfg=gray

if has('mouse')
  set mouse=c
endif

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.config/nvim/dein')
  call dein#begin('~/.config/nvim/dein')

  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})

  call dein#end()
  call dein#save_state()
endif
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------

" Key Bindings
let mapleader = "\<Space>"

" Space s で保存
nnoremap <silent><C-s> <Esc>:<C-u>w<CR>
inoremap <silent><C-s> <Esc>:<C-u>w<CR>

" Space d で編集中のペインを閉じる（:bd）
nnoremap <silent><leader>d <Esc>:<C-u>bd<CR>

" タブ移動をSpace + hjklで
nnoremap <silent><leader>w <C-w>w
nnoremap <silent><leader>h <C-w>h
nnoremap <silent><leader>j <C-w>j
nnoremap <silent><leader>k <C-w>k
nnoremap <silent><leader>l <C-w>l

" Ctrl+hjklでインサートモード中でも移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" Ctrl+eでNormalへ
map <silent><C-e> <Esc>
map! <silent><C-e> <Esc>
lmap <silent><C-e> <Esc>

" 次のタブを開く
nnoremap <silent><C-t> gt
inoremap <silent><C-t> <Esc>gt

" タブを閉じる
nnoremap <silent><C-x> <Esc>:<C-u>bd<CR>
inoremap <silent><C-x> <Esc>:<C-u>bd<CR>

inoremap <silent>jj <Esc>j
inoremap <silent>kk <Esc>k

" Ctrl+左右で行頭行末へ移動
noremap <silent><C-Left> 0
inoremap <silent><C-Left> <Esc>0i
noremap <silent><C-Right> $
inoremap <silent><C-Right> <Esc>$a

" Shift + 矢印で選択モード
nnoremap <silent><S-Up> <Esc>vk
nnoremap <silent><S-Down> <Esc>vj
nnoremap <silent><S-Left> <Esc>vh
nnoremap <silent><S-Right> <Esc>vl
vnoremap <silent><S-Up> k
vnoremap <silent><S-Down> j
vnoremap <silent><S-Left> h
vnoremap <silent><S-Right> l
inoremap <silent><S-Up> <Esc>vk
inoremap <silent><S-Down> <Esc>vj
inoremap <silent><S-Left> <Esc>vh
inoremap <silent><S-Right> <Esc>vl

" VisualでEnterはヤンク
vnoremap <silent><Enter> y

" space rでinit.vim読み込み :initeでinit.vimの編集
noremap <silent><leader>r <Esc>:<C-u>source ~/.config/nvim/init.vim<CR>
cnoremap <silent>inite :<C-u>tabe ~/.config/nvim/init.vim

let g:node_host_prog = '/usr/local/bin/neovim-node-host'
let g:coc_node_path = '/usr/bin/node'

let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-html',
      \ 'coc-lists',
      \ 'coc-phpls',
      \ 'coc-sh',
      \ 'coc-css',
      \ 'coc-stylelint',
      \ 'coc-vimlsp',
      \ 'coc-go',
      \ 'coc-elixir',
      \ 'coc-json',
      \ 'coc-eslint',
      \ 'coc-python',
      \ 'coc-java',
      \ 'coc-jest',
      \ 'coc-solargraph',
      \ 'coc-yaml',
      \ 'coc-highlight',
      \ 'coc-snippets',
      \ 'coc-docker',
      \ 'coc-diagnostic',
      \ 'coc-vetur'
      \]

autocmd BufRead,BufNewFile *.js.erb set filetype=javascript
autocmd BufRead,BufNewFile *.html.erb set filetype=ruby

set completeopt+=noinsert

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd VimEnter * execute 'CocInstall'

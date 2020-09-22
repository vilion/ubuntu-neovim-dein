syntax on
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

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
"nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
"nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
if exists('*coc#status()')
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
endif

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

let g:node_host_prog = '/usr/local/bin/neovim-node-host'
let g:coc_node_path = '/usr/local/bin/node'


autocmd BufRead,BufNewFile *.js.erb set filetype=javascript
autocmd BufRead,BufNewFile *.html.erb set filetype=ruby

set completeopt+=noinsert

"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd VimEnter * execute 'CocInstall'

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
syntax on

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

  let g:coc_global_extensions = [
        \ 'coc-html',
        \ 'coc-prettier',
        \ 'coc-lists',
        \ 'coc-tsserver',
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
        \ 'coc-vetur',
        \ 'coc-sql',
        \ 'coc-tabnine',
        \ 'coc-explorer',
        \ 'coc-git',
        \ 'coc-cfn-lint'
        \]

  augroup MyAutoCmd
    autocmd!
  augroup END

  autocmd MyAutoCmd FileType * call s:configure_lsp()
  function! s:configure_lsp() abort
    let l:coc_filetyps = [
      \ 'Dockerfile',
      \ 'bash',
      \ 'css',
      \ 'scss',
      \ 'html',
      \ 'javascript',
      \ 'json',
      \ 'markdown',
      \ 'python',
      \ 'typescript',
      \ 'vue',
      \ 'yaml',
      \ ]
    if match(l:coc_filetyps, &filetype) == -1
      return
    endif

    " Remap keys
    nmap <buffer><C-]> <Plug>(coc-definition)
    nmap <buffer><silent> gy <Plug>(coc-type-definition)
    nmap <buffer><silent> gi <Plug>(coc-implementation)
    nmap <buffer><silent> gr <Plug>(coc-references)
    nmap <buffer><leader>R   <Plug>(coc-rename)
    " Remap for format selected region
    vmap <buffer><leader>f   <Plug>(coc-format-selected)
    nmap <buffer><leader>f   <Plug>(coc-format-selected)
    " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
    vmap <buffer><leader>a   <Plug>(coc-codeaction-selected)
    nmap <buffer><leader>a   <Plug>(coc-codeaction-selected)
    " Remap for do codeAction of current line
    nmap <buffer><leader>ac  <Plug>(coc-codeaction)
    " Fix autofix problem of current line
    nmap <buffer><leader>qf  <Plug>(coc-fix-current)
    " Diagnostic
    nmap <buffer><silent> gd <Plug>(coc-diagnostic-info)
    nmap <buffer><silent> gn <Plug>(coc-diagnostic-next)
    nmap <buffer><silent> gp <Plug>(coc-diagnostic-prev)
    " Setup format selected region
    setlocal formatexpr=CocAction('formatSelected')
    " coc-git
    highlight default link GitGutterAdd           NONE
    highlight default link GitGutterChange        NONE
    highlight default link GitGutterDelete        NONE
    highlight default link GitGutterChangeDelete  NONE
    " Use K to show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    augroup CocNvimGroup
      autocmd!
      " Highlight symbol under cursor on CursorHold
      autocmd CursorHold * silent call CocActionAsync('highlight')
      " Update signature help on jump placeholder
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    command! -nargs=0 Prettier :CocCommand prettier.formatFile
  endfunction
  " Explorer
  nnoremap <silent> ge :CocCommand explorer<CR>
"End dein Scripts-------------------------

let g:go_version_warning = 0

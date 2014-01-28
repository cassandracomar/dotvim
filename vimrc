call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
set encoding=utf-8

if has("gui_running")
    set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim/
    set gfn=Inconsolata-dz\ for\ Powerline\ 11
    set guifontwide=Ubuntu\ Mono\ 11
endif

colo wombat256
hi Conceal guibg=DarkGray guifg=White
filetype off
set number
nnoremap <F2> :set nonumber!<CR>
set foldcolumn=1
set pastetoggle=<F3>
nnoremap <F3> :set invpaste<CR>

let g:ctags_statusline=1
let generate_tags=1

let Tlist_Use_Horiz_Window=0

nnoremap TT :TlistToggle<CR>
map <F4> :TlistToggle<CR>
map <F5> :TlistAddFiles src/*.cpp include/*.h ../include/*.h ../src/*.cpp *.cpp *.h<CR>

let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_File_Fold_Auto_close = 1

let g:alternateNoDefaultAlternate = 1
let g:alternateRelativeFiles = 1

let mapleader=","
filetype on
filetype plugin on
filetype indent on
syntax on
set autowrite
set ruler

set showcmd
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set smartindent
set autoindent
set laststatus=2
set wrap
set textwidth=120
set formatoptions=qrn1
set incsearch
set hlsearch
set ignorecase
set smartcase
set foldenable
set mousehide
set mouse=a


set foldmethod=syntax
nnoremap <leader>o zo
nnoremap <leader>a za
nnoremap <leader>c zc
nnoremap <leader>m zM
nnoremap <leader>r zR
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>s <C-w>s<C-w>j
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap d<leader>^ maj^mb`ad`b
nnoremap d<leader>g^ mak^mb`ad`b
nnoremap d<leader>$ mak$mb`ad`b
nnoremap d<leader>g$ maj$mb`ad`b

set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help
nmap <leader>ev :tabedit ~/.vim/vimrc<cr>
autocmd BufEnter * cd %:p:h
set wildmenu
set wildmode=list:longest
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

if has("autocmd")
	augroup myvimrchooks
	au!
	autocmd bufwritepost ~/.vim/vimrc source ~/.vimrc
	augroup END
endif

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

nnoremap <C-left> :tabprevious<CR>
nnoremap <C-right> :tabnext<CR>
nnoremap <silent> <A-left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-right> :execute 'silent! tabmove ' . tabpagenr()<CR>
let clojure#HighlightBuiltins = 1
let clojure#ParenRainbow = 1

" Let's remember some things, like where the .vim folder is.
 if has("win32") || has("win64")
     let windows=1
     let vimfiles=$HOME . "/vimfiles"
     let sep=";"
else
     let windows=0
     let vimfiles=$HOME . "/.vim"
     let sep=":"
endif

" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/cv

" build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <F12> :set tags+=./tags;/home/arjun<CR>

set completeopt=menuone,menu,longest,preview


" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <silent><expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" <BS>: close popup and delete backword char.
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() . "\<Space>" : "\<Space>"

let g:neocomplete#enable_insert_char_pre = 1
inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"

autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType python let b:did_ftplugin = 1
set ofu=syntaxcomplete#Complete

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

function! s:find_basedir() "{{{
" search Cabal file
    if !exists('b:ghcmod_basedir')
        let l:ghcmod_basedir = expand('%:p:h')
        let l:dir = l:ghcmod_basedir
        for _ in range(6)
            if !empty(glob(l:dir . '/*.cabal', 0))
                let l:ghcmod_basedir = l:dir
                break
            endif
            let l:dir = fnamemodify(l:dir, ':h')
        endfor
        let b:ghcmod_basedir = l:ghcmod_basedir
    endif
    return b:ghcmod_basedir
endfunction "}}}

" use ghc functionality for haskell files
let sandbox_dir = '/.cabal-sandbox/x86_64-linux-ghc-7.6.3-packages.conf.d'
let g:ghc="/usr/bin/ghc"
augroup filetype_hs
    autocmd!
    autocmd Bufenter *.hs compiler ghc
    let basedir = ""
    autocmd Bufenter *.hs let basedir = s:find_basedir()
    if basedir != ""
        autocmd Bufenter *.hs let dir = basedir . sandbox_dir
        autocmd Bufenter *.hs let b:ghc_staticoptions = '-package-db ' . dir . ' -fno-warn-missing-signatures'
        autocmd Bufenter *.hs let g:ghcmod_ghc_options = ['-package-db ' . dir, '-fno-warn-missing-signatures']
        autocmd BufEnter *.hs let g:GHCStaticOptions = '-package-db' . dir . ' -fno-warn-missing-signatures'
    endif
    autocmd BufWritePost *.hs GhcModCheckAndLintAsync
augroup END
let g:haddock_browser = "/usr/bin/firefox-aurora"
let g:GHCStaticOptions = "-O2"
let g:haskell_jmacro        = 0

hi ghcmodType ctermbg=yellow
let g:ghcmod_type_highlight = 'ghcmodType'
let g:haskell_conceal_wide = 1

let g:necoghc_enable_detailed_browse = 1
let g:neocomplete#force_overwrite_completefunc = 1

nnoremap <leader>d [i
inoremap <leader>c <C-x><C-o>
nmap <leader>R :GHCReload<CR>
nmap <leader>i _i
nmap <leader>hh _?
nmap <leader>hs _?1
nmap <leader>ie _ie
nmap <leader>g :make<CR>
nmap <leader>G s:cabalrepl()<CR>
nmap <leader>e :GhcModType <CR>
nmap <leader>q :noh<CR>

function! s:cabalrepl()
    return ':cd ' . s:find_basedir() . '\<CR>' . ' cabal repl %p\<CR>'
endfunction


let g:pymode_run_key = '<leader>R'
let g:pymode_lint_checher = "pyflakes"
let g:jedi#rename_command = "<leader>RR"

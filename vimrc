call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

filetype off
set number
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

let g:ctags_statusline=1
let generate_tags=1

let Tlist_Use_Horiz_Window=0

nnoremap TT :TlistToggle<CR>
map <F4> :TlistToggle<CR>

let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_File_Fold_Auto_close = 1

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
set textwidth=79
set formatoptions=qrn1
set incsearch
set hlsearch
set ignorecase
set smartcase
set foldenable
set mousehide
set mouse=a
nnoremap <leader>v <C-w>v<C-w>l

set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help
nmap <leader>ev :tabedit $MYVIMRC<cr>
autocmd BufEnter * cd %:p:h
imap <leader><tab><C-x><C-o>
set wildmenu
set wildmode=list:longest
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

if has("autocmd")
	augroup myvimrchooks
	au!
	autocmd bufwritepost .vimrc source ~/.vimrc
	augroup END
endif

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

let classpath = join ( 
   \[".",
   \ "src", "src/main/clojure", "src/main/resources",
   \ "test", "src/test/clojure", "src/test/resources",
   \ "classes", "target/classes",
   \ "lib/*", "lib/dev/*",
   \ "bin",
   \ vimfiles."/lib/*"
   \],
   \ sep )

" Settings for VimClojure
 let vimclojureRoot = vimfiles."/bundle/vimclojure"
 let vimclojure#HighlightBuiltins=1
 let vimclojure#HighlightContrib=1
 let vimclojure#DynamicHighlighting=1
 let vimclojure#ParenRainbow=1
 let vimclojure#WantNailgun = 1
 let vimclojure#NailgunClient = vimclojureRoot."/lib/nailgun/ng"
" if windows
"     " In stupid windows, no forward slashes, and tack on .exe
"         let vimclojure#NailgunClient = substitute(vimclojure#NailgunClient,
"         "/", "\\", "g") . ".exe"
"         endif
"
"         " Start vimclojure nailgun server (uses screen.vim to manage
"         lifetime)
nmap <silent> <Leader>sc :execute "ScreenShell java -cp \"" . classpath . sep . vimclojureRoot . "/lib/*" . "\" vimclojure.nailgun.NGServer 127.0.0.1" <cr>
" Start a generic Clojure repl (uses screen.vim)
nmap <silent> <Leader>sC :execute "ScreenShell java -cp \"" . classpath . "\" clojure.main" <cr>

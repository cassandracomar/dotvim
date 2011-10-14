call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

filetype off
set number
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
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

" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/cv

" build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <F12> :set tags+=./tags;/home/arjun<CR>

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD", "cv"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

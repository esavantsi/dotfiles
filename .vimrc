if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" Bundles
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'tacahiroy/ctrlp-funky'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'bling/vim-airline'

filetype plugin indent on

NeoBundleCheck

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General editor settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
scriptencoding utf-8

set number                      " Line numbers
set title
set cursorline
set mouse=a
set pastetoggle=<F12>
set fillchars=""
set ruler
set autoindent
set ignorecase
set autoread
set shortmess+=filmnrxoOtT
set cmdheight=2
set clipboard=unnamed
set foldenable
set viewoptions=folds,options,cursor,unix,slash
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo
set noerrorbells                " No beep

" Default encoding
set encoding=utf-8
set fileencoding=utf-8

" Cursor alignment
set scrolloff=100
set sidescroll=1
set sidescrolloff=10

" Tabulation
set backspace=2
set laststatus=2
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4

" Compatibility
set nocp
set nowrap
set incsearch
set hidden
set showmode
set showcmd

" History
set history=100
set undolevels=100
set virtualedit=onemore
set undodir=~/.vim/undodir
set undofile
set nobackup                " No backup file
set noswapfile              " No swap file

" Splitting
set splitbelow
set splitright

" The auto completion row menu in the bottom of the bar
set wildignore+=*/tmp/*,*.so.*,*.swp,*.zip
set wildignorecase
set wildmenu
set wildmode=longest,list:longest,full
let &wildcharm = &wildchar

" NERDTree
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeShowLineNumbers = 0
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = 30

" Molokai
let g:molokai_original = 1

" CTRLP
let g:ctrlp_cmd = 'CtrlPMixed'          " search anything (in files, buffers and MRU files at the same time.)
let g:ctrlp_working_path_mode = 'ra'    " search for nearest ancestor like .git, .hg, and the directory of the current file
let g:ctrlp_match_window_bottom = 0     " show the match window at the top of the screen
let g:ctrlp_by_filename = 1
let g:ctrlp_max_height = 10             " maxiumum height of match window
let g:ctrlp_switch_buffer = 'et'        " jump to a file if it's open already
let g:ctrlp_use_caching = 1             " enable caching
let g:ctrlp_clear_cache_on_exit=0       " speed up by not removing clearing cache evertime
let g:ctrlp_mruf_max = 250              " number of recently opened files

set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Syntastic
let g:syntastic_check_on_wq = 1
let g:syntastic_check_header = 1
let g:syntastic_error_symbol='✕'
let g:syntastic_warning_symbol='✕'
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [], 'passive_filetypes': [] }
let g:syntastic_python_checkers = ['pylint', 'flake8']
let g:syntastic_javascript_checkers = ['jslint', 'jshint']
let g:syntastic_cpp_compiler_options = ' -std=c++11'

" Airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.whitespace = 'Ξ'

" Neocomplcache
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default' : '',
  \ }

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
    " Match whitespaces visually with a red background
    autocmd ColorScheme * highlight ExtraWhiteSpace ctermbg=red guibg=red
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/

    " Neocomplcache
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Switch tabs with Alt+N
noremap <A-1> 1gt
noremap <A-2> 2gt
noremap <A-3> 3gt
noremap <A-4> 4gt
noremap <A-5> 5gt
noremap <A-6> 6gt
noremap <A-7> 7gt
noremap <A-8> 8gt
noremap <A-9> 9gt

" Ctrl+Tab, Ctrl+Shift+Tab; switch between tabs
noremap <C-Tab> :tabnext<CR>
noremap <C-S-Tab> :tabprev<CR>

noremap <silent><Space>f :CtrlPFunky<cr>
noremap <silent><Space>p :CtrlPCurWD<cr>

noremap <Space>r :set rnu!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
colorscheme molokai

if has("gui_running")
  syntax on
  set hlsearch
  set guifont=Terminus\ 9
  set guioptions=ac             " remove toolbar
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cursor colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set colorcolumn=80
hi CursorLine guibg=#333333     " highlight bg color of current line
hi CursorColumn guibg=#CCCCCC   " highlight cursor column
hi Cursor guibg=#FFFFFF         " highlight cursor
hi ColorColumn ctermbg=Black

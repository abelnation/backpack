
" enable pathogen plugin manager. see:
call pathogen#infect()

" disable specific macvim keybindings
let macvim_hig_shift_movement = 1
let macvim_skip_cmd_opt_movement = 1

" Base settings
set nocompatible				" choose no compatibility with legacy vi
set encoding=utf-8
set showcmd						" display incomplete commands
filetype plugin indent on		" load file type plugins + indentation

" Disable arrow keys for training
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Colors
set background=dark
colorscheme desert

" Fonts
if has('gui_running')
  set guifont=Consolas:h16
endif

" Use OSX clipboard
set clipboard=unnamed

" Set up leader shortcuts
let mapleader = ","

" Search and replace word under cursor
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" disable auto-comment after newline when in a commented line
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" remap section navigation to any bracket, regardless of column
:map [[ ?{<CR>w99[{
:map ][ /}<CR>b99]}
:map ]] j0[[%/{<CR>
:map [] k$][%?}<CR>

" set max window size to 0 to allow better stacking/minimizing of windows
set wmh=0

" window maximize/minimize
nnoremap <C-W>O :call MaximizeToggle()<CR>
nnoremap <C-W>o :call MaximizeToggle()<CR>
nnoremap <C-W><C-O> :call MaximizeToggle()<CR>

function! MaximizeToggle()
  " window are maximized
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
    exec ":NERDTree"
    exec "normal \<C-w>\<C-p>"
  " windows are not maximized
  else
    exec ":NERDTreeClose"
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

" Alt+arrow keys moves between split windows
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" Set to auto read when a file is changed from the outside
set autoread

set hid "Change buffer - without saving

" Fast editing of the .vimrc
map <leader>e :e! ~/.vimrc<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

" syntax highlighting on
syntax on
syntax enable
" javascript extensions
autocmd BufNewFile,BufRead *.es6   set syntax=javascript

" tabs are 4 spaces
set tabstop=4
set shiftwidth=4
set autoindent

" ignores case unless search term is uppercase
set ignorecase
set smartcase

" allow backspacing over indent, eol, and start of an insert
" set backspace=2
set backspace=indent,eol,start

" Showing invisible characters
set list
set listchars=tab:▸\  " eol:¬ Use the same symbols as TextMate for tabstops and EOLs

" when page starts to scroll, keep cursor 8 lines from top and bottom
set scrolloff=8

" turn tabs into spaces
" set expandtab

" Searching
set hlsearch				" enable search highlighting
set incsearch				" incrementally match the search
set ignorecase				" searches are case insensitive
set smartcase				" ... unless they contain a capital letter

" make <esc> clear search results
nnoremap <esc> :noh<return><esc>

" key sequence kj is mapped to esc for getting out of insert mode
inoremap kj <Esc>

" Status line improvements
set statusline=%f%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2 

"
" Plugins
"

" YouCompleteMe
" prevent pattern not found message
set shortmess+=c

" Ctrl-P
" ignore certain directories
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|node_modules|build)$',
  \ }
let g:ctrlp_extensions = ['tag']
:map <c-s-down> :CtrlPTag

" NerdTree
" show file tree at startup if no files were specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <leader>n :NERDTreeToggle<cr>
map <c-e> :NERDTreeToggle<cr>

" show hidden files by default
let NERDTreeShowHidden=1

" Multiple cursors

" esc in insert mode does not quit multiple cursors
let g:multi_cursor_exit_from_insert_mode = 0


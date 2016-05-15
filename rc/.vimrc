
" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = []

" for some reason the csscolor plugin is very slow when run on the terminal
" but not in GVim, so disable it if no GUI is running
if !has('gui_running')
endif

" Gundo requires at least vim 7.3
if v:version < '704' || !has('python')
    call add(g:pathogen_disabled, 'YouCompleteMe')
endif

if v:version < '704'
    call add(g:pathogen_disabled, 'vim-javascript')
    call add(g:pathogen_disabled, 'vim-jsx')
endif

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

" No WordWrap
set nowrap

" Colors
if has("gui_running")
    colorscheme desert
elseif &t_Co == 256
    colorscheme desert256
    set cursorline
    hi CursorLine ctermbg=darkred ctermfg=white 
endif

" tweak iterm cursors
" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

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

" map 0 to same as ^ (beginning of text on line)
:map 0 ^

" easy quoting
:nnoremap <Leader>q" ciw""<Esc>P
:nnoremap <Leader>q' ciw''<Esc>P

" delete quotes
:nnoremap <Leader>qd daW"=substitute(@@,"'\\\|\"","","g")<CR>P

" Have the indent commands re-highlight the last visual selection to make
" multiple indentations easier
vnoremap > >gv
vnoremap < <gv

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
set expandtab
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
hi NonText ctermfg=7 guifg=darkgray
hi SpecialKey ctermfg=7 guifg=darkgray

" when page starts to scroll, keep cursor 8 lines from top and bottom
set scrolloff=8

" turn tabs into spaces
" set expandtab

" Navigating between tabs
nnoremap <C-j> gt
nnoremap <C-k> gT

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
" set statusline=%f%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2 
set ruler

"
" Plugins
"

" YouCompleteMe
" prevent pattern not found message
set shortmess=a

" Ctrl-P
" ignore certain directories
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|node_modules|build)$',
  \ }
let g:ctrlp_extensions = ['tag']
:map <c-t> :CtrlPTag<cr>

" show hidden files (e.g. .gitignore)
let g:ctrlp_show_hidden = 1

" configure height and num results
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:25,results:25'


" NerdTree
" show file tree at startup if no files were specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" map <leader>n :NERDTreeToggle<cr>
" map <c-e> :NERDTreeToggle<cr>

" NerdTree Tabs
map <Leader>n :NERDTreeToggle<CR>
map <C-e> :NERDTreeToggle<CR>

" show hidden files by default
let NERDTreeShowHidden=1

" ignore extensions
let NERDTreeIgnore = ['\.swp$', '\.pyc$', '\.DS_Store$']

" Default NerdTree size
let NERDTreeWinSize = 24

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

" Multiple cursors

" esc in insert mode does not quit multiple cursors
let g:multi_cursor_exit_from_insert_mode = 0

" Easy-Motion

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)

map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" EasyAlign

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" MiniBufExplorer
map gn :bn<cr>
map gp :bp<cr>
map gd :MBEbd<cr> 

map <leader>b :MBEToggle<cr>

" EsFormatter
let g:esformatter_exec = fnamemodify("./node_modules/.bin/esformatter", ':p')

" will run esformatter after pressing <leader> followed by the 'e' and 's' keys
autocmd FileType javascript nnoremap <buffer> <Leader>f :Esformatter<CR>
autocmd FileType javascript vnoremap <buffer> <Leader>f :EsformatterVisual<CR>

" Ack
" map <c-f> :Ack 

" vim-move
let g:move_key_modifier = 'C'

" vim-smooth-scroll
set scroll=10
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 5, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 5, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 5, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 5, 4)<CR>

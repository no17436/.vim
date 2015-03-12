
"
" run & configure pathogen
"
call pathogen#infect()

"
" kick-ass defaults
"
set nocompatible  "to get rid of unnecessary vi compatibility
set bs=2          "set backspace to be able to delete previous characters
set number        "enable line numbering, taking up 6 spaces
set rnu           "relative line numbering (so useful when using for ex. 25j)
let mapleader="," "set leader to ,
set modelines=0   "for security (http://lists.alioth.debian.org/pipermail/pkg-vim-maintainers/2007-June/004020.html)
syntax on
set scrolloff=3   "3 lines of buffer when scrolling
"write regexp without annoying \/
"nnoremap / /\v
"vnoremap / /\v
set gcr=n:blinkon0 "non blinking cursor in normal mode
set vb t_vb=      "no irritating visual bell
" set clipboard=unnamed "force to use system clipboard
set mouse=a "use mouse even in cli
set ttyfast "fast terminal (improves responsiveness)
set laststatus=2 "always show full status (with powerline, etc.)

" disable anoying baloons from vim-ruby and NerdTree
set balloondelay=100000
set noballooneval

"
" indenting
"
filetype indent on        "indent depends on filetype
filetype plugin indent on "indent based on pathogen?
set tabstop=2             "set tab character to 2 characters
set shiftwidth=2          "set indent width for autoindent
set sw=2 sts=2 et         " Use 2 spaces everywhere
set expandtab             "turn tabs into whitespace
set smartindent           "Turn on smart indent
set wrap!                 "Turn off word wrapping
set eol                   " Ensure newline at EOF on save
set textwidth=79
set formatoptions=qrn1

" mark 100th and 120th characters
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn="100,120"

" Removes trailing spaces on save
au BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

"
" incremental search
"
set ignorecase "case-insensitive by default... but...
set smartcase  "if you type at least one upper cased letter it becomes case-sensitive
set gdefault   "so you can skip /g in %s/aaa/bbb/g
set incsearch
set showmatch
set hlsearch
"hide search highlight with ,<space>
nnoremap <leader><space> :noh<cr>

"
" document navigation
"

"Folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
" set foldlevel=1         "this is just what i use

" RSpec.vim mappings and settings
map <Leader>f :call RunCurrentSpecFile()<CR>
map <Leader>r :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_runner = "os_x_iterm"


" map space to toggle fold
nnoremap <Space> za
" map space to open recursively fold
nnoremap <S-Space> zO

"go to opening/closing bracket with tab
nnoremap <tab> %
vnoremap <tab> %

"Shortcuts to auto hard-indent entire file (like cleanup in tidy)
nmap <F11> 1G=G
imap <F11> <ESC>1G=Ga

" Informative status line
" set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)]

" config for https://github.com/lucapette/vim-ruby-doc
let g:ruby_doc_command='open'

" snippets
let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby,rails,no17436'
let g:snipMate.scope_aliases['haml'] = 'ruby,rails,no17436,haml'

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

let g:syntastic_ruby_checkers = ['rubocop']
" let g:syntastic_ruby_checkers = ['mri', 'rubocop']


" solarized color scheme (http://ethanschoonover.com/solarized)
"set t_Co=16
"let g:solarized_termcolors=16
"let g:solarized_termtrans=1
"set background=dark
" colorscheme solarized
" colorscheme railscasts
" colorscheme github

" colorscheme gruvbox
" set bg=dark    " Setting dark mode
" set t_Co=256

" molokai theme
" let g:rehash256 = 1
" colorscheme molokai
" set background=dark

" colorscheme Tomorrow-Night-Eighties
colorscheme Tomorrow-Night

set cursorline " set line highlight

" turn on rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


"
" Backups & Files (doesn't work on windows)
"
set backup                   " Enable creation of backup file.
set backupdir=~/.vim/backups " Where backups will go.
set directory=~/.vim/tmp     " Where temporary files will go.

" Auto save files when focus is lost
" au FocusLost * silent! wa
" set autowriteall

"
" UTF
"
scriptencoding utf-8
set encoding=utf-8
set fileencodings=utf-8


"
" key bindings
"

" switch between last 2 buffers
nnoremap <leader><leader> <c-^>

" tabs
map tj :tabnext<CR>
map tk :tabprev<CR>
map th :tabfirst<CR>
map tl :tablast<CR>
map tt :tabedit<Space>
map tn :tabnext<Space>
map tm :tabm<Space>
map tn :tabnew<CR>
map td :tabclose<CR>

"new vertical split with focus
nnoremap <leader>s <C-w>v<C-w>l

"close vertical split
nnoremap <leader>c <C-w>c

" insert ruby hash operator
inoremap <C-l> <Space>=><Space>

" save all buffers
nnoremap ; :wa<cr>

" nnoremap <leader>y "+y
" vnoremap <leader>y "+y

" use ,. to reload snippets and .vimrc (so usefull when changing configs when working on a project)
nnoremap <leader>. :call ReloadAllSnippets()<cr>:so $MYVIMRC<cr>

" next (ctrl + n) / previous (ctrl + shift + n) Ack result
nnoremap <C-S-n> :cp<cr>
nnoremap <C-n> :cn<cr>

" open word in Dash.app
inoremap <F1> <ESC>:Dash<cr>
nnoremap <F1> :Dash<cr>
vnoremap <F1> :Dash<cr>

" running test through tpope's Dispatch plugin
inoremap <F8> :Dispatch bundle exec rspec %<CR>
nnoremap <F8> :Dispatch bundle exec rspec %<CR>
inoremap <F9> :Copen<CR>
nnoremap <F9> :Copen<CR>

" quick access for opening files (from sourcetree or github path)
nnoremap <leader>e :e<space>

nmap <leader>x <Plug>ToggleAutoCloseMappings

" use ,a {phrase} to Ack-grep project for a phrase
nnoremap <leader>a :Ack<space>

" open current buffer in new tab (useful for getting out of splits)
nnoremap <leader>t :tabedit %<CR>


"
" Ruby & Rails specific
"

"coffeescript foldable after zi
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable

"custom file extensions
au BufNewFile,BufRead *.thor set filetype=ruby

" ignore files (for ctrlp)
set wildignore+=*/tmp/*,*.so,*.swp,*.zip


"
"functions
"

"wrap lines
function! WrapLinesAtWord()
  if(&wrap == 1)
    set wrap!
  else
    set wrap
    set linebreak
  endif
endfunc

nnoremap <C-w>r :call WrapLinesAtWord()<cr>


" expand current path (credits: destroy all software) das-0013-file-navigation-in-vim
cnoremap %% <C-R>=expand('%:h').'/'<CR>

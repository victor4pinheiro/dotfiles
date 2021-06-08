set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Theme
Plugin 'whatyouhide/vim-gotham'
Plugin 'jaredgorski/spacecamp'
"Better commenter
Plugin 'preservim/nerdcommenter'

" Use git with project
Plugin 'airblade/vim-gitgutter'

" Auto completion for brackets, keys, etc
Plugin 'jiangmiao/auto-pairs'

" Ultimate Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Emmet
Plugin 'mattn/emmet-vim'

" Change both start and end tag
Plugin 'andrewradev/tagalong.vim'

" Completions
Plugin 'shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'

" Completions and Fixer
Plugin 'dense-analysis/ale'

" Nerd Tree
Plugin 'ryanoasis/vim-devicons'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'preservim/nerdtree'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

" Check syntax errors
Plugin 'scrooloose/syntastic'

" Show buffers
Plugin 'zefei/vim-wintabs'

" Rainbow brackets
Plugin 'frazrepo/vim-rainbow'

call vundle#end()            " required
filetype plugin indent on    " required

set number
set nocompatible              " be iMproved, required
filetype off                  " required

colorscheme gotham
" colorscheme spacecamp

"" Enconding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab

"" Map leader
let mapleader=','

"" Terminal
nnoremap <C-z> :below terminal<CR>
set termwinsize=10x0

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set fileformats=unix,dos,mac

"""" Visual Settings
syntax on
set ruler
set mousemodel=popup

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

if exists('$SHELL')
  set shell=$SHELL
else
  set shell=/usr/bin/fish
endif

"" Nerd Comments
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDToggleCheckAllLines = 1

"" Gitgutter
set updatetime=100
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}

"" Ultimate Snips
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Deoplete
let g:deoplete#enable_at_startup = 1

"" Syntatisc

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$',     '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '    \~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

"" Close buffer
inoremap <leader>c :bd<CR>

"" Vim Rainbow
let g:rainbow_active = 1

"" ALE
let g:ale_lint_on_enter = 0
let g:ale_fix_on_save = 0
let g:ale_linters_explicit = 1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fixers = {
\ 'php': ['php_cs_fixer'],
\ 'javascript': ['eslint', 'prettier'],
\ 'html': ['prettier'],
\ 'css': ['prettier'],
\ 'c': ['clang-format'],
\ 'cpp': ['clang-format'],
\}

"PHP
let g:ale_php_phpcs_executable='/home/arch/.config/composer/vendor/bin/phpcs'
let g:ale_php_php_cs_fixer_executable='/home/arch/.config/composer/vendor/bin/php-cs-fixer'

" HTML
autocmd FileType html setlocal tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" Python
autocmd FileType python setlocal tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" C
autocmd FileType c setlocal tabstop=8 softtabstop=0 expandtab shiftwidth=8 smarttab

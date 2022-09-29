" I don't know what this does.
set nocompatible

" Recognize filetypes.
filetype on

" Enable syntax highlighting.
syntax on

" Set hybrid line numbers.
set number
set relativenumber

" Set highlighted cursor line.
set cursorline

" Set tab length.
set shiftwidth=4
set tabstop=4

" Expand tabs into spaces, because 202.
set expandtab

" Backups are for nerds.
set nobackup

" Disable word wrapping.
set nowrap

" Keep 15 lines of context above / below cursor when scrolling.
set scrolloff=10

" Highlight all pattern matches.
set incsearch

" Case-insensitive search.
set ignorecase

" Case-sensitive search if capitals are used.
set smartcase

" Show partial commands.
set showcmd

" Show current mode.
set showmode

" Show matching parentheses, etc.
set showmatch

" Highlight search matches.
set hlsearch

" Keep command history of 1000.
set history=1000

" Autocomplete menu.
set wildmenu
set wildmode=list:longest

" Ignore particular files in autocomplete menu.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Set config path according to version of vim running.
if has("nvim")
    let config='~/.config/nvim'
else
    let config='~/.vim'
endif

" Auto-install vim-plug.
if empty(glob(config.'/autoload/plug.vim'))
    silent execute '!curl -fLo '.config.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall
endif

" Initiate vim-plug and install plugins.
call plug#begin(config.'/plugged')
    Plug 'mhinz/vim-startify'
    Plug 'preservim/nerdcommenter'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'morhetz/gruvbox'
    Plug 'wellle/context.vim'
    if has("nvim")
        Plug 'andweeb/presence.nvim'
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
    endif
call plug#end()

" Will config coc.nvim later.

" Set colors for neovim.
if(empty($TMUX))
    if(has("nvim"))
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
endif

set background=dark
autocmd vimenter * ++nested colorscheme gruvbox

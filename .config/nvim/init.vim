" _
"| |__  _ __ _   _ _ __   ___
"| '_ \| '__| | | | '_ \ / _ \  Bruno Montezano
"| |_| | |  | |_| | | | | (_) | https://github.com/brunomontezano/dotfiles
"|_.__/|_|   \__,_|_| |_|\___/
"
" My custom .vimrc for Vim and Neovim use.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle For Managing Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " Required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.config/vim/bundle/Vundle.vim

call vundle#begin('~/.config/vim/bundle/')	    	" Required, all plugins must appear after this line.

Plugin 'gmarik/Vundle.vim'							" Vundle
Plugin 'folke/tokyonight.nvim'                      " Tokyo Night colorscheme
Plugin 'itchyny/lightline.vim'                      " Lightline Status Bar
Plugin 'vimwiki/vimwiki'                            " Vim Wiki
Plugin 'ap/vim-css-color'                           " Color previews for CSS
Plugin 'tpope/vim-surround'                         " Change surrounding marks
Plugin 'junegunn/goyo.vim'                          " Distraction-free writing
Plugin 'jalvesaq/Nvim-R'                            " R code in Vim

call vundle#end()		" Required, all plugins must appear before this line.

filetype plugin indent on    " Required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remap Keys and Background
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Change leader key to ","
let maplocalleader = ","
let mapleader =";"

" Set bg
set background=dark
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ctrl-Space to autocompletion in Nvim-R
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Theming and statusline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set color scheme
let g:tokyonight_style = "night"
let g:tokyonight_italic_functions = 1
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]
colorscheme tokyonight

" Set lightline color scheme
let g:lightline = {'colorscheme': 'tokyonight'}

" Always show statusline
set laststatus=2

" Uncomment to prevent non-normal modes showing in powerline and below powerline.
set noshowmode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Preferences 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set real colors
set termguicolors

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" Enable syntax highlighting
syntax enable   

" Set relative line numbering
set number relativenumber
let g:rehash256 = 1

" Mouse scrolling
set mouse=nicr

" Use system clipboard
set clipboard=unnamedplus

" Removes pipes | that act as seperators on splits
set fillchars+=vert:\ 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimWiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{'path': '~/dox/repos/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright

set path+=**					" Searches current directory recursively.
set wildmenu					" Display all matches when tab complete.
set incsearch
set nobackup
set noswapfile

let g:minimap_highlight='Visual'

set guioptions-=m  " Remove menu bar
set guioptions-=T  " Remove toolbar
set guioptions-=r  " Remove right-hand scroll bar
set guioptions-=L  " Remove left-hand scroll bar

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Compiling files and TeX macros
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Clean TeX files when closing
autocmd VimLeave *.tex !texclear %

" Remove red highlighting from errors
autocmd FileType tex :hi Error NONE

" Compile documents from multiple formats
map <Leader>c :w! \| !compiler <c-r>%<CR>

" Show output from given file
map <Leader>p :!opout <c-r>%<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Goyo Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Toggle Goyo
map <leader>f :Goyo \| set linebreak<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nvim-R
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Press -- to have Nvim-R insert the assignment operator: <-
let R_assign_map = "--"

" Split horizontal space evenly between R source and console
let R_rconsole_width = winwidth(0) / 2
autocmd VimResized * let R_rconsole_width = winwidth(0) / 2

" Don't expand a dataframe to show columns by default
let R_objbr_opendf = 0

" Press the space bar to send lines and selection to R console
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine

" Shortcut for magrittr pipe
autocmd FileType r inoremap <buffer> >> <Esc>:normal! a %>%<CR>a 
autocmd FileType rmd inoremap <buffer> >> <Esc>:normal! a %>%<CR>a 

" Rebind autocompletion
autocmd FileType r inoremap <C-Space> <C-x><C-o>
autocmd FileType rmd inoremap <C-Space> <C-x><C-o>

" Auto-match parenthesis and curly brackets
inoremap ( ()<Left>
inoremap { {}<Left>

" Break line in R code if limit width is reached
autocmd FileType r setlocal formatoptions+=t

" Ctrl + Space to open completion window
inoremap <C-Space> <C-x><C-o>

" Use terminal colorscheme in R output
let rout_follow_colorscheme = 1

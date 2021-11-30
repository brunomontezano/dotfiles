" _
"| |__  _ __ _   _ _ __   ___
"| '_ \| '__| | | | '_ \ / _ \  Bruno Montezano
"| |_| | |  | |_| | | | | (_) | https://github.com/brunomontezano/dotfiles
"|_.__/|_|   \__,_|_| |_|\___/
"
" My custom .vimrc for Vim and Neovim use (tested on Neovim).

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle For Managing Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " Required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.config/vim/bundle/Vundle.vim

call vundle#begin('~/.config/vim/bundle/')	    	" Required, all plugins must appear after this line.

" => Basics
Plugin 'gmarik/Vundle.vim'							" Vundle
Plugin 'itchyny/lightline.vim'                      " Lightline Status Bar
" => Theming
Plugin 'morhetz/gruvbox'                            " Gruvbox Colorscheme
Plugin 'shinchu/lightline-gruvbox.vim'              " Gruvbox for Lightline
Plugin 'ap/vim-css-color'                           " Color previews for CSS
" => Productivity
Plugin 'vimwiki/vimwiki'                            " Vim Wiki
Plugin 'junegunn/goyo.vim'                          " Distraction-free writing
" => Tools
Plugin 'tpope/vim-surround'                         " Change surrounding marks
Plugin 'jiangmiao/auto-pairs'                       " Create objects in pairs
Plugin 'ervandew/supertab'                          " Use TAB for completion
" => Programming
Plugin 'neoclide/coc.nvim'                          " Completion and LSP support
Plugin 'jalvesaq/Nvim-R'                            " R code in Vim
Plugin 'jalvesaq/vimcmdline'                        " Send lines to interpreter

call vundle#end()		" Required, all plugins must appear before this line.

filetype plugin indent on    " Required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remap Leader Keys and Background
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Local Leader
let maplocalleader = "," 

" Global Leader
let mapleader =";"

" Set backgrund theme
set background=dark


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => SuperTab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Reverse SuperTab order
let g:SuperTabDefaultCompletionType = "<c-n>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Theming and statusline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set Vim and Lightline colorscheme 
let g:gruvbox_italic=1
let g:gruvbox_bold=1
colorscheme gruvbox

" Set lightline theme and coc status information
let g:lightline = {
	\ 'colorscheme': 'gruvbox',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'cocstatus': 'coc#status'
	\ },
	\ }

" Use autocmd to force lightline coc.nvim update
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" Always show statusline
set laststatus=2

" Uncomment to prevent non-normal modes showing in powerline and below powerline.
set noshowmode

" More space for messages
set cmdheight=2

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
" Set Markdown syntax and change VimWiki path
let g:vimwiki_list = [{'path': '~/dox/repos/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Create horizontal splits below and vertical splits on right by default
set splitbelow splitright

set path+=**					" Searches current directory recursively
set wildmenu					" Display all matches when tab complete
set incsearch                   " Perform incremental search
set nobackup                    " Discard use of backup files
set noswapfile                  " Discard use of swap files

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
" Toggle Goyo function
map <Leader>f :Goyo \| set linebreak<CR>

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
autocmd FileType r inoremap <buffer> > <Esc>:normal! a %>%<CR>a
autocmd FileType rnoweb inoremap <buffer> > <Esc>:normal! a %>%<CR>a
autocmd FileType rmd inoremap <buffer> > <Esc>:normal! a %>%<CR>a

" Break line in R code if limit width is reached
autocmd FileType r setlocal formatoptions+=t

" Ctrl + Space to open completion window
inoremap <C-Space> <C-x><C-o>

" Use terminal colorscheme in R output
let rout_follow_colorscheme = 1

" Use Enter key to confirm completion
inoremap <expr> <cr> ((pumvisible())?("\<C-y>"):("\<cr>"))

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimcmdline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Interpreter follows terminal colorscheme
let cmdline_follow_colorscheme = 1
let cmdline_app = {}
let cmdline_app['sh'] = 'bash'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto-pairs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:AutoPairsMapCR = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gnuplot syntax highlighting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.plt,*.gnuplot setf gnuplot

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Netrw
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:netrw_banner = 0

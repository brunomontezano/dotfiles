" _
"| |__  _ __ _   _ _ __   ___
"| '_ \| '__| | | | '_ \ / _ \  Bruno Montezano
"| |_| | |  | |_| | | | | (_) | https://github.com/brunomontezano/dotfiles
"|_.__/|_|   \__,_|_| |_|\___/
"
" My custom .vimrc for vim and neovim use.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle For Managing Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " Required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.config/vim/bundle/Vundle.vim

call vundle#begin('~/.config/vim/bundle/')	    	" Required, all plugins must appear after this line.

Plugin 'gmarik/Vundle.vim'							" Vundle
Plugin 'itchyny/lightline.vim'                      " Lightline Status Bar
Plugin 'vifm/vifm.vim'                              " Use Vifm inside Vim
Plugin 'vimwiki/vimwiki'                            " Vim Wiki
Plugin 'scrooloose/nerdtree'						" Add NerdTree
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'    " Add syntax highlighting to NerdTree
Plugin 'ryanoasis/vim-devicons'                     " Add some pretty icons
Plugin 'vim-python/python-syntax'                   " Python syntax highlighting
Plugin 'ap/vim-css-color'                           " Color previews for CSS
Plugin 'tpope/vim-surround'                         " Change surrounding marks
Plugin 'jalvesaq/Nvim-R'                            " R on Vim
Plugin 'junegunn/goyo.vim'                          " Distraction-free writing

call vundle#end()		" Required, all plugins must appear before this line.

filetype plugin indent on    " Required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remap Keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Change leader key to ","
let mapleader =","

"Remap ESC to ii
"imap ii <Esc>

"Remap Space+Space to travel for the <++> on tex and html documents
autocmd FileType tex inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
autocmd FileType html inoremap <Space><Space> <Esc>/<++><Enter>"_c4l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Powerline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set lightline color scheme
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

syntax enable   
set number relativenumber
let g:rehash256 = 1

" Uncomment to prevent non-normal modes showing in powerline and below powerline.
set noshowmode

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
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Uncomment to autostart the NERDTree
" autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=38

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vifm (Current leader key = ,) (Default leader key = \)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>vv :Vifm<CR>
map <Leader>vs :VsplitVifm<CR>
map <Leader>sp :SplitVifm<CR>
map <Leader>dv :DiffVifm<CR>
map <Leader>tv :TabVifm<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimWiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mouse Scrolling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=nicr

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

let g:python_highlight_all = 1

set guioptions-=m  " Remove menu bar
set guioptions-=T  " Remove toolbar
set guioptions-=r  " Remove right-hand scroll bar
set guioptions-=L  " Remove left-hand scroll bar


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Removes pipes | that act as seperators on splits
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fillchars+=vert:\ 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Use system clipboard
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamedplus

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Execute texclear script when leaving .tex file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd VimLeave *.tex !texclear %

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Open the output file from the opened file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>c :w! \| !compiler <c-r>%<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Open the output file from the opened file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>p :!opout <c-r>%<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remove red highlighting from errors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType tex :hi Error NONE

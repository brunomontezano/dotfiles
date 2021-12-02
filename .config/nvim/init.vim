" _
"| |__  _ __ _   _ _ __   ___
"| '_ \| '__| | | | '_ \ / _ \  Bruno Montezano
"| |_| | |  | |_| | | | | (_) | https://github.com/brunomontezano/dotfiles
"|_.__/|_|   \__,_|_| |_|\___/  init.vim
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark " Dark or light
set laststatus=2 " Always show statusline
set noshowmode " Prevent repeated mode below statusline
set cmdheight=2 " Number of lines used for the command-line
set termguicolors " Use GUI colors for the terminal
set t_Co=256 " Use 256 colours (Use this setting only if your terminal supports 256 colours)
syntax enable " Use syntax highlighting
set number relativenumber " Use relative numbers
let g:rehash256 = 1 " 256 colors
set mouse=nicr " Mouse scrolling
set clipboard=unnamedplus " Use system clipboard
set expandtab " Use spaces instead of tabs
set smarttab " Tab in an indent inserts shiftwidth spaces
set shiftwidth=4 " Number of spaces used for each step of indent
set tabstop=4 " Number of spaces a Tab in the text stands for
set splitbelow splitright " New window is ut below or right of the current one
set path+=** " Searches current directory recursively
set wildmenu " Display all matches when tab complete
set incsearch " Perform incremental search
set nobackup " Discard use of backup files
set noswapfile " Discard use of swap files
set guioptions-=m " Remove menu bar
set guioptions-=T " Remove toolbar
set guioptions-=r " Remove right-hand scroll bar
set guioptions-=L " Remove left-hand scroll bar
set rtp+=~/.config/vim/bundle/Vundle.vim " Add Vundle file to runtime path
filetype plugin indent on " Detection, plugin and indent by filetype

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call vundle#begin('~/.config/vim/bundle/')

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

call vundle#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let maplocalleader = "," " Set local leader
let mapleader =";" " Set global leader
let R_assign_map = "--" " Nvim-R -> Press -- to have Nvim-R insert the assignment operator: <-
let R_objbr_opendf = 0 " Nvim-R -> Don't expand a dataframe to show columns by default
let R_rconsole_width = winwidth(0) / 2 " Nvim-R -> Split evenly between R source and console
let rout_follow_colorscheme = 1 " Nvim-R -> Use terminal colorscheme in R output
let cmdline_follow_colorscheme = 1 " vimcmdline -> Interpreter follows terminal colorscheme
let cmdline_app = {} " vimcmdline -> Create dictionary for new interpreters
let cmdline_app['sh'] = 'bash' " vimcmdline -> Use bash as sh interpreter
let g:netrw_banner = 0 " Netrw -> Remove netrw banner
let g:AutoPairsMapCR = 0 " AutoPairs -> Do not insert new indented line with cursor between pairs
let g:gruvbox_italic=1 " Gruvbox -> Use italic
let g:gruvbox_bold=1 " Gruvbox -> Use bold
colorscheme gruvbox " Set color palette
let g:SuperTabDefaultCompletionType = "<c-n>" " Ctrl+N goes next in completion
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
let g:vimwiki_list = [{'path': '~/dox/repos/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Compile documents from multiple formats
map <Leader>c :w! \| !compiler <c-r>%<CR>
" Show output from given file
map <Leader>p :!opout <c-r>%<CR><CR>
" goyo.vim -> Toggle Goyo function
map <Leader>f :Goyo \| set linebreak<CR>
" Nvim-R -> Press the space bar to send lines and selection to R console
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine
" Use Enter key to confirm completion
inoremap <expr> <cr> ((pumvisible())?("\<C-y>"):("\<cr>"))

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcut for magrittr pipe in R and Rmd files
autocmd FileType r,rmd inoremap <buffer> > <Esc>:normal! a %>%<CR>a
" Update coc.nvim status in lightline
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
" Clean TeX files when closing
autocmd VimLeave *.tex !texclear %
" Remove red highlighting from errors in TeX files
autocmd FileType tex :hi Error NONE
" Nvim-R -> Source and Console even size
autocmd VimResized * let R_rconsole_width = winwidth(0) / 2
" Gnuplot syntax highlighting in plt and gnuplot files
autocmd BufNewFile,BufRead .plt,*.gnuplot setf gnuplot

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable " Use syntax highlighting
filetype plugin indent on " Detection, plugin and indent by filetype
set background=dark " Dark or light
set clipboard=unnamedplus " Use system clipboard
set path+=** " Searches current directory recursively
set laststatus=2 " Always show statusline
set shiftwidth=4 " Number of spaces used for each step of indent
set tabstop=4 " Number of spaces a Tab in the text stands for
set expandtab " Use spaces instead of tabs
set smarttab " Tab in an indent inserts shiftwidth spaces
set noshowmode " Prevent repeated mode below statusline
set termguicolors " Use GUI colors for the terminal
set number relativenumber " Use relative numbers
set splitbelow splitright " New window is ut below or right of the current one
set wildmenu " Display all matches when tab complete
set incsearch " Perform incremental search
set nobackup " Discard use of backup files
set noswapfile " Discard use of swap files

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/site/plugins')

" => Basics
Plug 'itchyny/lightline.vim'                      " Lightline Status Bar
" => Theming
Plug 'morhetz/gruvbox'                            " Gruvbox Colorscheme
Plug 'shinchu/lightline-gruvbox.vim'              " Gruvbox for Lightline
Plug 'ap/vim-css-color'                           " Color previews for CSS
" => Tools
Plug 'tpope/vim-surround'                         " Change surrounding marks
Plug 'jiangmiao/auto-pairs'                       " Create objects in pairs
Plug 'ervandew/supertab'                          " Use TAB for completion
" => Programming
Plug 'neoclide/coc.nvim'                          " Completion and LSP support
Plug 'jalvesaq/Nvim-R'                            " R code in Vim
Plug 'jalvesaq/vimcmdline'                        " Send lines to interpreter

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let maplocalleader = "," " Set local leader
let mapleader =";" " Set global leader
let R_assign_map = "--" " Nvim-R -> Press -- to have Nvim-R insert the assignment operator: <-
let R_objbr_opendf = 0 " Nvim-R -> Don't expand a dataframe to show columns by default
let rout_follow_colorscheme = 1 " Nvim-R -> Use terminal colorscheme in R output
let cmdline_follow_colorscheme = 1 " vimcmdline -> Interpreter follows terminal colorscheme
let cmdline_app = {} " vimcmdline -> Create dictionary for new interpreters
let cmdline_app['sh'] = 'bash' " vimcmdline -> Use bash as sh interpreter
let g:netrw_banner = 0 " Netrw -> Remove netrw banner
let g:AutoPairsMapCR = 0 " AutoPairs -> Do not insert new indented line with cursor between pairs
let g:gruvbox_italic=1 " Gruvbox -> Use italic
let g:gruvbox_bold=1 " Gruvbox -> Use bold
colorscheme gruvbox " Set color palette
let g:SuperTabDefaultCompletionType = "<c-n>" " Supertab -> Ctrl+N goes next in completion
let g:lightline = {'colorscheme': 'gruvbox'} " Lightline.vim -> Set colorscheme

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Compile documents from multiple formats
map <Leader>c :w! \| !compiler <c-r>%<CR>
" Show output from given file
map <Leader>p :!opout <c-r>%<CR><CR>
" Nvim-R -> Press the space bar to send lines and selection to R console
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine
" Use Enter key to confirm completion
inoremap <expr> <cr> ((pumvisible())?("\<C-y>"):("\<cr>"))

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" R shortcuts
autocmd FileType r,rmd inoremap <buffer> __ <Esc>:normal! a <-<CR>a 
autocmd FileType r,rmd inoremap <buffer> >> <Esc>:normal! a %>%<CR>a 
autocmd FileType r,rmd inoremap <buffer> << <Esc>:normal! a \|><CR>a
" LaTeX file cleaning script
autocmd VimLeave *.tex !texclear %
" Remove red highlighting in TeX files
autocmd FileType tex :hi Error NONE
" Gnuplot syntax highlighting
autocmd BufNewFile,BufRead .plt,*.gnuplot setf gnuplot

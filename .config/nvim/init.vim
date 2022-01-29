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

" => Theming
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'chrisbra/Colorizer'                         " Color previews
" => Tools
Plug 'itchyny/lightline.vim'                      " Lightline Status Bar
Plug 'tpope/vim-surround'                         " Change surrounding marks
Plug 'vimwiki/vimwiki'                            " Personal Wiki in Vim
" => Programming
Plug 'neoclide/coc.nvim', {'branch': 'release'}   " Completion and LSP support
Plug 'honza/vim-snippets'                         " Snippet files
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
let r_indent_align_args = 0 " ft-r-indent -> Do not align arguments
let r_indent_ess_comments = 0 " ft-r-indent -> Do not comment like ESS
let r_indent_ess_compatible = 0 " ft-r-indent -> Do not make ESS compatible
let cmdline_follow_colorscheme = 1 " vimcmdline -> Interpreter follows terminal colorscheme
let cmdline_app = {} " vimcmdline -> Create dictionary for new interpreters
let cmdline_app['sh'] = 'bash' " vimcmdline -> Use bash as sh interpreter
colorscheme catppuccin " Set color palette
let g:lightline = { 'colorscheme': 'catppuccin' }
let g:vimwiki_list = [{'path': '~/dox/repos/mywiki', 'path_html': '~/dox/repos/mywiki/html_path'}] " vimwiki -> Change paths

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
" coc.nvim ->
" Use <CR> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
" Use <Tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<Tab>" : coc#refresh()
" Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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
autocmd BufNewFile,BufRead *.plt,*.gnuplot setf gnuplot

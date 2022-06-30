"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable " Use syntax highlighting
filetype plugin indent on " Detection, plugin and indent by filetype
set background=dark " Dark or light
set clipboard=unnamedplus " Use system clipboard
set path+=** " Searches current directory recursively
set laststatus=2 " Always show statusline
set showtabline=2
set shiftwidth=4 " Number of spaces used for each step of indent
set tabstop=4 " Number of spaces a Tab in the text stands for
set expandtab " Use spaces instead of tabs
set smarttab " Tab in an indent inserts shiftwidth spaces
set ignorecase " Ignore case when searching
set smartcase " Smart case sensitive or insensitive search
set noshowmode " Prevent repeated mode below statusline
set termguicolors " Use GUI colors for the terminal
set number relativenumber " Use relative numbers
set splitbelow splitright " New window is ut below or right of the current one
set wildmenu " Display all matches when tab complete
set incsearch " Perform incremental search
set nobackup " Discard use of backup files
set noswapfile " Discard use of swap files
set cursorline " Highlight current line
set hidden
set colorcolumn=80 "Set indicator in column 80

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/site/plugins')

Plug 'catppuccin/nvim', {'as': 'catppuccin'}      " Catppuccin theme
Plug 'chrisbra/Colorizer'                         " Color previews
Plug 'itchyny/lightline.vim'                      " Lightline Status Bar
Plug 'tpope/vim-surround'                         " Change surrounding marks
Plug 'vimwiki/vimwiki'                            " Personal Wiki in Vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}   " Completion and LSP support
Plug 'honza/vim-snippets'                         " Snippet files
Plug 'jalvesaq/Nvim-R'                            " R code in Vim
Plug 'lervag/vimtex'                              " LaTeX tool
Plug 'jalvesaq/vimcmdline'                        " Send lines to interpreter
Plug 'taohexxx/lightline-buffer'                  " Bufferline
Plug 'ryanoasis/vim-devicons'                     " Icons
Plug 'Raimondi/delimitMate'                       " Automatic closing
Plug 'ctrlpvim/ctrlp.vim'                         " Fuzzy finder
Plug 'tpope/vim-fugitive'                         " Git plugin

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let maplocalleader = "," " Set local leader
let mapleader =";" " Set global leader
let R_assign_map = "__" " Nvim-R -> Press -- to have Nvim-R insert the assignment operator: <-
let R_objbr_opendf = 0 " Nvim-R -> Don't expand a dataframe to show columns by default
let rout_follow_colorscheme = 1 " Nvim-R -> Use terminal colorscheme in R output
let r_indent_align_args = 0 " ft-r-indent -> Alignment of arguments
let r_indent_ess_comments = 1 " ft-r-indent -> Comments like ESS
let r_indent_ess_compatible = 1 " ft-r-indent -> ESS compatible
let cmdline_follow_colorscheme = 1 " vimcmdline -> Interpreter follows terminal colorscheme
let cmdline_app = {} " vimcmdline -> Create dictionary for new interpreters
let cmdline_app['sh'] = 'bash' " vimcmdline -> Use bash as sh interpreter
let cmdline_app['python'] = 'ipython' " vimcmdline -> Use bash as sh interpreter
let g:catppuccin_flavour = "dusk"
colorscheme catppuccin " Set color palette
let g:lightline_buffer_enable_devicons = 1
let g:lightline = {
    \ 'colorscheme': 'catppuccin',
    \ 'tabline': {
    \   'left': [ [ 'bufferinfo' ],
    \             [ 'separator' ],
    \             [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
    \   'right': [ [ 'close' ], ],
    \ },
    \ 'component_expand': {
    \   'buffercurrent': 'lightline#buffer#buffercurrent',
    \   'bufferbefore': 'lightline#buffer#bufferbefore',
    \   'bufferafter': 'lightline#buffer#bufferafter',
    \ },
    \ 'component_type': {
    \   'buffercurrent': 'tabsel',
    \   'bufferbefore': 'raw',
    \   'bufferafter': 'raw',
    \ },
    \ 'component_function': {
    \   'bufferinfo': 'lightline#buffer#bufferinfo',
    \ },
    \ 'component': {
    \   'separator': '',
    \ },
    \ }
let g:vimwiki_list = [{'path': '~/dox/repos/mywiki', 'path_html': '~/dox/repos/mywiki/html_path'}] " vimwiki -> Change paths
let g:vimwiki_global_ext = 0 " vimwiki -> Don't overwrite md files' filetype to vimwiki
let g:vimtex_view_method = 'zathura'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|jpg|jpeg|mp4|avi|docx|xlsx|odt|pptx|pdf|mp3|flac|gif|png|ods|eps|svg|db|odg|mkv|doc|rar|zip|sav|m3u|cue|Rproj|m|rds|iso|ini|lnk|7z|epub|agd|gt3x|aux|ico|AppImage|wav|info|apk|3gp|webp|wps|docm|db-journal|m4a|bkup|sla|htm|download|ppt|dsf|odp|dat|log|so|swp|dcf|djvu|MPG|RData|nav)$'}
set wildignore+=*/tmp/*,*dox/misc/*,*/mus/*,*/google-takeout/*,*/dox/uni/*,*/vid/*

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
" Buffer management
nnoremap <A-.> :bnext<CR>
nnoremap <A-,> :bprev<CR>
nnoremap <A-c> :bdelete<CR>

" Vim Fugitive
noremap ,gc :Git commit % -m "
noremap ,gsh :Git push<CR>
noremap ,gs :Git<CR>
noremap ,gd :Gvdiff<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" R shortcuts
autocmd FileType r,rmd inoremap <buffer> >> <Esc>:normal! a %>%<CR>a 
autocmd FileType r,rmd inoremap <buffer> << <Esc>:normal! a \|><CR>a


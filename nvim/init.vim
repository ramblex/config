set nocompatible
filetype off

" call plug#begin()
"
" Plug 'gmarik/Vundle.vim'
" Plug 'vim-test/vim-test'
" Plug 'tpope/vim-dispatch'
" Plug 'mattn/emmet-vim'
" Plug 'groenewege/vim-less'
" Plug 'tpope/vim-fugitive'
" Plug 'fatih/vim-go'
" Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
" Plug 'leafgarland/typescript-vim'
" Plug 'tpope/vim-abolish'
" Plug 'nvim-treesitter/nvim-treesitter'
" Plug 'tpope/vim-rails'
" Plug 'airblade/vim-gitgutter'
" Plug 'hashivim/vim-terraform'
" Plug 'neovim/nvim-lsp'
" Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-telescope/telescope.nvim'
" Plug 'nvim-lua/popup.nvim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
" Plug 'BurntSushi/ripgrep'
" Plug 'gruvbox-community/gruvbox'
" Plug 'folke/tokyonight.nvim'
" Plug 'numToStr/Comment.nvim'
" Plug 'L3MON4D3/LuaSnip'
" Plug 'RRethy/nvim-treesitter-endwise'
" Plug 'nvim-treesitter/playground'
"
"
" call plug#end()

lua << EOF
require('ramblex')
EOF

filetype on
filetype plugin on
filetype indent on

syn on
" Security
set modelines=0
" Tabs/spaces

set encoding=utf-8
set scrolloff=3
set autoindent
set backspace=indent,eol,start
set laststatus=2
set directory=~/.vim-swp/
set noswapfile
set ruler                   " Show the cursor position all the time
set wildmenu                " Display files when using e
set wildmode=list:longest
set ttyfast
"set ttyscroll=3
"set lazyredraw
set nofoldenable
set termguicolors
set cursorline
set number
set scrolloff=8
set relativenumber
set nu

set undofile
set undodir=~/.vimundo

let mapleader = "\<Space>"

set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
set title
nnoremap <leader>, :noh<cr>

set wrap
set textwidth=79
set colorcolumn=90
set formatoptions=qrn1

set list listchars=tab:»-,trail:·,extends:»,precedes:«

nnoremap <Leader>g :Git<CR>
xnoremap <Leader>dp :diffput<CR>
xnoremap <Leader>dg :diffget<CR>

set t_ut=

" CtrlP
nnoremap <leader>b <cmd>Telescope buffers<CR>
nnoremap <leader>f <cmd>Telescope find_files<CR>
"hi def link CtrlPMatch CursorLine
" Ignore some folders and files for CtrlP indexing
"let g:ctrlp_custom_ignore = {
  "\ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
  "\ 'file': '\.so$\|\.dat$|\.DS_Store$'
  "\ }

nnoremap <leader><leader>j :%!jq<CR>

hi Normal ctermbg=NONE

"colorscheme bubblegum-256-light
"colorscheme PaperColor
"colorscheme wombat256
"colorscheme molokai
"colorscheme gruvbox
"colorscheme tokyonight
"set background=light
"colorscheme nord
"set background=dark
set background=dark

au FileType go nmap <Leader>gd <Plug>(go-doc)
let g:go_fmt_command = "goimports"

augroup vimrcEx
  autocmd!

  " Jump to last cursor position unless it's invalid or in an event handler or
  " a git commit
  au BufReadPost *
    \ if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  " Innova code uses 3!!!!!! spaces
  au BufNewFile,BufRead ~/code/innova/recorder-apps *.cpp,*.h setlocal sts=3 ts=3 sw=3 tw=79

  " Make Python follow PEP8
  au FileType python setlocal sts=4 ts=4 sw=4 tw=79
  au FileType go setlocal nolist
augroup END

" add jbuilder syntax highlighting
au BufNewFile,BufRead *.json.jbuilder set ft=ruby
au BufNewFile,BufRead Jenkinsfile set ft=groovy
au BufNewFile,BufRead *.m set ft=octave
au BufNewFile,BufRead *.tt set ft=treetop
au BufNewFile,BufRead *.tsx set ft=typescript

imap jj <Esc>

nmap <leader>s :lua require('neotest').run.run()<CR>
nmap <leader>t :lua require('neotest').run.run(vim.fn.expand('%'))<CR>
nmap <leader>tn :lua require('neotest').jump.next({ status = "failed" })<CR>
nmap <leader>tp :lua require('neotest').jump.next({ status = "failed" })<CR>
nmap <leader>ts :lua require('neotest').summary.toggle()<CR>
nmap <leader>ta :lua require('neotest').run.attach()<CR>
nmap <leader>to :lua require('neotest').output.open({ enter = true })<CR>
nmap <leader>l :lua require('neotest').run.run_last()<CR>
nmap <leader>n :cn<CR>

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

" Enable git gutter
let g:gitgutter_async=0

hi def link TSVariable Normal
hi def link rubyTSPunctDelimiter TSFunction

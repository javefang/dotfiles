call plug#begin()
" theme
Plug 'morhetz/gruvbox'

" ui
Plug 'itchyny/lightline.vim'

" file management
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'

" editing enhancement
Plug 'dense-analysis/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'airblade/vim-gitgutter'

" language support
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'jamessan/vim-gnupg'
Plug 'tsandall/vim-rego'
Plug 'hashivim/vim-terraform'
call plug#end()

" neovim provider
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0
let g:python3_host_prog='/usr/bin/python3'

" set colorscheme
set background=dark
colorscheme gruvbox 

" true color
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" keep background transparent
hi Normal guibg=NONE ctermbg=NONE

" default encoding
set encoding=UTF-8

" show line number
set number

" always show sign column
set signcolumn=yes

" set 120-char line
set colorcolumn=120

" set default tab to 2 spaces
set shiftwidth=2
set expandtab

" hide default mode display in status as it is already showing in lightline
set noshowmode

" speed up redraw
set lazyredraw
set ttyfast

" make gitgutter update more promptly
set updatetime=1000

" make clipboard work
set clipboard=unnamed

" clear highlight on esc
nnoremap <esc> :noh<return><esc>

" jj to escape
imap jj <esc>

" auto show NERDTree when vim is called without file
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" nerdtree
let g:NERDTreeWinSize=40

" auto close vim if NERDTree is the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" fzf config
let g:fzf_layout = { 'down': '~30%' }

" fzf ignore filename when full text searching
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

" supertab
let g:SuperTabDefaultCompletionType = "context"

" vim-go
let g:go_code_completion_enabled = 1
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 0
let g:go_auto_type_info = 1
let g:go_addtags_transform = "snakecase"

" disable completion in vim-go (using coc)
let g:go_code_completion_enabled = 0

" vim-terraform: enable align
let g:terraform_fmt_on_save = 1

" ale
let g:ale_open_list = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_virtualenv_dir_names = []
let g:ale_python_black_options = '-l 120'
let g:ale_linters = {
\  'python': ['flake8'],
\  'go': ['gobuild', 'golangci-lint'],
\  'javascript': ['eslint'],
\}
let g:ale_fixers = {
\  'python': ['black'],
\  'go': ['goimports'],
\}

" coc
"
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" airline
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0

" shortcuts
map <C-n> :NERDTreeToggle<CR>
map <C-t> :tabnew<CR>
map <C-p> :Rg<CR>
map <C-f> :Files<CR>
map <C-m> :ALEToggleBuffer<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


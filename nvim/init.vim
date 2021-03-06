set nocompatible              " be iMproved, required
set encoding=UTF-8

call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Docker
Plug 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}

" Syntax
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'digitaltoad/vim-pug'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'gko/vim-coloresque'
Plug 'jiangmiao/auto-pairs'
Plug 'posva/vim-vue'
Plug 'cakebaker/scss-syntax.vim'
Plug 'godlygeek/tabular'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-liquid'
Plug 'ledger/vim-ledger'

" Quality of Life
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'ryanoasis/vim-devicons'
Plug 'markonm/traces.vim'
" ^ Requires a working 'nerd' font to be installed and configured.
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'mattn/emmet-vim'
Plug 'easymotion/vim-easymotion'
Plug 'plytophogy/vim-virtualenv'
Plug 'dhruvasagar/vim-dotoo'
Plug 'jceb/vim-orgmode'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'jamessan/vim-gnupg'
Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ 'branch': 'release/1.x',
      \ 'for': [
      \ 'javascript',
      \ 'typescript',
      \ 'css',
      \ 'less',
      \ 'scss',
      \ 'json',
      \ 'graphql',
      \ 'markdown',
      \ 'vue',
      \ 'lua',
      \ 'php',
      \ 'python',
      \ 'ruby',
      \ 'html',
      \ 'swift' ] }
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Lightline
Plug 'itchyny/lightline.vim'

" Themes
Plug 'dracula/vim'
Plug 'morhetz/gruvbox'
Plug 'jnurmine/Zenburn'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'gosukiwi/vim-atom-dark'
Plug 'rakr/vim-one'
Plug 'kaicataldo/material.vim'
call plug#end()
" Indentation Add ability to see whitespace/eol 
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣ 

" Tab Sizes
" By default, the indent is 2 spaces.
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set breakindent
set lbr

" Python
autocmd Filetype python setlocal ts=4 sw=4 sts=0 expandtab

" Ledger
autocmd Filetype ledger setlocal ts=4 sw=4 sts=0 noexpandtab

" Mail
autocmd Filetype mail setlocal tw=0 wrap

" Lightline
let g:lightline = {
      \ 'colorscheme': 'material_vim',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" Emmet Leader
let g:user_emmet_leader_key='<C-k>'

" Git Gutter
let g:gitgutter_sign_added = '▋'
let g:gitgutter_sign_modified = '▋'
let g:gitgutter_sign_removed = '▋'
let g:gitgutter_sign_removed_first_line = '▋'
let g:gitgutter_sign_modified_removed = '▋'

" vim-javascript
let g:javascript_plugin_flow = 1

" vim-jsx
let g:jsx_ext_required = 0

" Vue Crap
autocmd FileType vue syntax sync fromstart
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue

" Preferences
set number relativenumber
set nu rnu
set clipboard+=unnamedplus

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

""""""" Mappings
nmap <C-k>b :NERDTreeToggle<CR>

" Use tab completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Buffers
nmap <leader>l :ls<CR>
nmap <leader>] :bn!<CR>
nmap <leader>[ :bp!<CR>
nmap <leader>bd :bd<CR>
nmap <leader>bda :bd <C-a><CR>
nmap <leader>bds :b#<bar>bd#<CR>

" Fugitive
nmap <leader>gs :Gstatus<CR>

" FZF
nmap <leader>ff :Files<CR>
nmap <leader>fb :Buffers<CR>
nmap <leader>fg :GFiles<CR>
nmap <leader>fc :Colors<CR>
nmap <leader>fa :Ag<CR>
nmap <leader>fr :Rg<CR>

" Whitespace Character Toggle
nmap <leader>s :set list!<CR>

" Themes
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
set background=dark

"""""" Material Theme
let g:material_theme_style = 'dark'
let g:material_terminal_italics = 1
colorscheme material

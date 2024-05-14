set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Golang Support
Plugin 'fatih/vim-go'

" Rust Support
Plugin 'rust-lang/rust.vim'

" GDScript Support
Plugin 'habamax/vim-godot'

" LF
Plugin 'ptzz/lf.vim'
Plugin 'voldikss/vim-floaterm'

" Completion
Plugin 'ycm-core/YouCompleteMe'

" Snippets
Plugin 'SirVer/ultisnips'

" Color Code Highlighting
Plugin 'RRethy/vim-hexokinase'

" Git Integration
Plugin 'tpope/vim-fugitive'

" Statusline
Plugin 'itchyny/lightline.vim'

" Synthwave Colors
Plugin 'artanikin/vim-synthwave84'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
set background=dark
set termguicolors
colorscheme synthwave84
set relativenumber
" from my old-ass vimrc
set ignorecase
set smartcase
set hlsearch
set incsearch
set magic
set showmatch
set mat=2
set number
set noswapfile
" Tabstops etc
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smarttab

set lbr

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set virtualedit=all

set ch=2

set vb

set backspace=2

set hidden

set cpoptions=ces$

set showmode

" File Finding
set path+=**
set wildmenu

set splitbelow

" For lightline
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'rosepine',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" YCM Options
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_auto_hover = ''

" YCM Keybinds
function! YcmKeys()
    nnoremap si :YcmCompleter GoToDefinition<cr>
    nnoremap sk :YcmRestartServer<cr>
    nnoremap <F1> :YcmCompleter FixIt<cr>
    nnoremap K :YcmCompleter GetHover<cr>
    nnoremap ; :YcmCompleter GetType<cr>
    nmap <leader>k <plug>(YCMHover)
endfunction

" GDScript Configuration
function! GDScriptSetup()
    set noexpandtab
    call YcmKeys()
endfunction

if !has_key( g:, 'ycm_language_server' )
  let g:ycm_language_server = []
endif

let g:ycm_language_server += [
  \   {
  \     'name': 'godot',
  \     'filetypes': [ 'gdscript' ],
  \     'project_root_files': [ 'project.godot' ],
  \     'port': 6005
  \   }
  \ ]

let g:godot_executable = '/home/skelemental/godot/godot'

" Golang Configuration
function! GolangSetup()
    set noexpandtab
    call YcmKeys()
endfunction

augroup rust
    autocmd!
    autocmd FileType rust call YcmKeys()
augroup end

augroup python
    autocmd!
    autocmd FileType python call YcmKeys()
augroup end

augroup go
    autocmd!
    autocmd FileType go call GolangSetup()
augroup end

augroup gdscript
    autocmd!
    autocmd FileType gdscript call GDScriptSetup()
augroup end


" Hexokinase Options
 let g:Hexokinase_highlighters = ['sign_column']

" Ultisnips Options
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

let g:UltiSnipsExpandTrigger="<S-TAB>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

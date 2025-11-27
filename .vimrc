set nocompatible
set noerrorbells
set nowrap
set noswapfile
set number
set cursorline
set laststatus=2
set colorcolumn=80 
set hlsearch

syntax on
filetype plugin indent on 

let mapleader = " "

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'scrooloose/nerdtree'
Plugin 'morhetz/gruvbox'
Plugin 'KKPMW/vim-sendtowindow'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'jpalardy/vim-slime'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-pandoc/vim-rmarkdown'
Plugin 'preservim/vim-markdown'

call vundle#end()            " required

" Indentación para .sh
autocmd Filetype sh setlocal ts=2 sts=2 sw=2 expandtab

" Indentación para .c
autocmd Filetype c setlocal ts=4 sts=4 sw=4 expandtab

" Indentación para .R
autocmd Filetype r setlocal ts=2 sts=2 sw=2 expandtab

autocmd Filetype rmd setlocal ts=2 sts=2 sw=2 expandtab
"autocmd BufRead,BufNewFile *.Rmd set filetype=markdown.pandoc
autocmd FileType perl setlocal ts=4 sts=4 sw=4 expandtab

" Movimiento entre splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Tamaño de splits
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize -3<CR>
noremap <silent> <C-Down> :resize +3<CR>

" Cambio de orientación splits
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Orden de apertura de splits
set splitbelow splitright

" Atajo NerdTree
map <leader>nn :NERDTreeToggle<CR>
" Atajo para pausar terminal Ctrl+W Shift+N
tnoremap <C-t> <C-w>N

colorscheme gruvbox
set background=dark

" Atajo para imprimir sintaxis para código en md con formato de R
nnoremap <leader>RR o```{r}<CR>```<Esc>3O<Esc>ki
inoremap <leader>RR o```{r}<CR>```<Esc>3O<Esc>ki

" Atajo para imprimir sintaxis para código en md sin formato
nnoremap <leader>FF o```<CR>```<Esc>3O<Esc>ki
inoremap <leader>FF o```<CR>```<Esc>3O<Esc>ki

" Atajo para imprimir %>% para tidyverse 
nnoremap <leader>MM a %>%a<CR>
inoremap <leader>MM a %>%a<CR>

" Atajo para imprimir %>% en la misma linea
nnoremap <leader>mm a %>% 
inoremap <leader>mm <Esc>a %>% 

" Mover lineas con - y _
nnoremap - ddkkp
nnoremap _ ddp

" Atajo para imprimir sintaxis para código en md con sintaxis bash
nnoremap <leader>BB i```bash<CR>```<Esc>3O<Esc>ki

let g:markdown_fenced_languages = ['bash', 'r', 'perl']

let g:vim_markdown_conceal = 0

" ---- Vim-Slime Configuration ----
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": ":0.1"}
let g:slime_dont_ask_default = 1


" Mover selección arriba y abajo con J K
xnoremap J :m '>+1<CR>gv=gv
xnoremap K :m '<-2<CR>gv=gv

" Rodear con ", ' ( [  y {
vnoremap <leader>Rc c"<C-r>""<Esc>
vnoremap <leader>Rk c'<C-r>"'<Esc>
vnoremap <leader>Rp c'<C-r>"'<Esc>
vnoremap <leader>RC c'<C-r>"'<Esc>
vnoremap <leader>Rl c'<C-r>"'<Esc>


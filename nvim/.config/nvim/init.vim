" hello front end masters
set path+=**

" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_buildeng-3279-storage-usage-bytes-utility-method/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
" Yanks to the system clipboard
set clipboard=unnamedplus

call plug#begin('~/.vim/plugged')

" Color schemes and styles.
Plug 'ambv/black'
Plug 'gruvbox-community/gruvbox'
Plug 'flazz/vim-colorschemes'

" Automatic LSP configuration
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

" Shows the current scope at the top as you scroll
Plug 'wellle/context.vim'

" Neovim Tree sitter.
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" Code completion (LSP / treesitter)
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}

" Prettier.
Plug 'sbdchd/neoformat'

" Better control of the undo buffer.
Plug 'mbbill/undotree'

" Telescope requirements.
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" File navigator
" https://github.com/ms-jpq/chadtree
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

" Neovim statusbar customization
Plug 'nvim-lualine/lualine.nvim'

" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'

" !important: install nerd fonts to get nice icons
" https://github.com/ryanoasis/nerd-fonts#font-installation
" To make this work:
" - Download your font from: https://www.nerdfonts.com/font-downloads
" - Unzip it to ~/.fonts
" - Run: $ fc-cache -fv
" (currently using: DroidSansMono)

Plug 'nvim-telescope/telescope-file-browser.nvim'

" Code coverage highlight for instanbul coverage files.
Plug 'andythigpen/nvim-coverage'

call plug#end()

" Look at me, I'm the lua guy now
lua require("zani")

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
" map <space> as the leader to make it easy to execute scripts
let mapleader = " "

nnoremap <leader>vwh :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>bs /<C-R>=escape(expand("<cWORD>"), "/")<CR><CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :Ex<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

" map <space>+u/v to resize the current pane
" and +rr to resise/restore to 100
nnoremap <Leader>ll :vertical resize +5<CR>
nnoremap <Leader>aa :vertical resize -5<CR>
nnoremap <Leader>rr :resize 100<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" copy from cursor until the end of the line
nnoremap Y yg$
" move the window content up and down
nnoremap n nzzzv
nnoremap N Nzzzv
" join lines without moving the cursor
nnoremap J mzJ`z

" greatest remap ever
xnoremap <leader>p "_dP

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" File Manager *CHADtree
nnoremap <leader>fb <cmd>CHADopen<cr>

inoremap <C-c> <esc>

" Format JSON: uses jq as the tool (sudo apt install jq)
nmap <Leader>fj <cmd>%!jq .<cr>

fun! EmptyRegisters()
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
        call setreg(r, [])
    endfor
endfun

" ES
com! W w

nmap <leader>nn :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

" Syntax highlighting
syntax enable

" Setup the new statusbar
lua << END
require('lualine').setup()
END

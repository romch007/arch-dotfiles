set encoding=utf-8
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set cursorline
set nocompatible              " be iMproved, required
set autoindent
set smartindent
set number
set lazyredraw
set ttyfast
set hidden
set updatetime=300
set shortmess+=c
set relativenumber
set belloff=all
set noerrorbells
set vb t_vb=
set rtp +=~/.vim
set virtualedit=block
syntax on
set noswapfile
nnoremap <SPACE> <Nop>
let mapleader="\<Space>"

set incsearch

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'cohama/lexima.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-gitgutter'
Plug 'watzon/vim-edge-template'
call plug#end()

let g:rainbow_active = 1
set background=dark
colorscheme gruvbox

function! StartUp()
    if 0 == argc()
        NERDTree
        :wincmd l
    end
endfunction
autocmd VimEnter * call StartUp()

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

nmap <C-s> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$','node_modules$']

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_custom_ignore = 'node_modules\|\.git|\.build|\.dist'

let g:airline_powerline_fonts = 1

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

let g:lexima_no_default_rules = 1
call lexima#set_default_rules()
call lexima#insmode#map_hook('before', '<CR>', '')


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" 
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
" 
" " Use <c-space> to trigger completion.
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif
" 
" function! s:my_cr_function() abort
"   " Combine deoplete's smart close with lexima's expansion.
"   return pumvisible() ? "\<C-y>" : "\<C-g>u" . lexima#expand('<CR>', 'i')
" endfunction
" 
" inoremap <expr> <CR> <sid>my_cr_function()
" " inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" 
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction
" 
" " Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>
" 
" " Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')
" 
" " Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)
" 
" " Remap <C-f> and <C-b> for scroll float windows/popups.
" if has('nvim-0.4.0') || has('patch-8.2.0750')
"   nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"   inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"   inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"   vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" endif
" 
" nnoremap <silent> <C-p> :Files .<CR>
" nnoremap <silent> <leader>b :Buffers<CR>
" 
" let g:fzf_colors = {}
" 
" let g:fzf_colors.fg      = ['fg', 'GruvboxFg1']
" let g:fzf_colors.bg      = ['fg', 'GruvboxBg0']
" let g:fzf_colors.hl      = ['fg', 'GruvboxRed']
" let g:fzf_colors['fg+']  = ['fg', 'GruvboxGreen']
" let g:fzf_colors['bg+']  = ['fg', 'GruvboxBg1']
" let g:fzf_colors['hl+']  = ['fg', 'GruvboxRed']
" let g:fzf_colors.info    = ['fg', 'GruvboxOrange']
" " let g:fzf_colors.border  = ['fg', 'GruvboxBg0']
" let g:fzf_colors.prompt  = ['fg', 'GruvboxAqua']
" let g:fzf_colors.pointer = ['fg', 'GruvboxOrange']
" let g:fzf_colors.marker  = ['fg', 'GruvboxYellow']
" let g:fzf_colors.spinner = ['fg', 'GruvboxGreen']
" let g:fzf_colors.header  = ['fg', 'GruvboxBlue']

nnoremap Y y$

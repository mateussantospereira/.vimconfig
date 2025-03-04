syntax on
set number
set hls
set ignorecase
set wildmode=longest,list
set hlg=pt
set ai

" Teclas para sair
nnoremap q :q<cr>
nnoremap <c-q> :q!<cr>

" Tecla para salvar
" echo "stty -ixon" >> ~/.bashrc
nnoremap <c-s> :w<cr>

" Abrir terminal automaticamente
nnoremap <c-k> :terminal<cr>

" Barra lateral 
nnoremap <c-b> :let g:netrw_liststyle=3<cr>:Lex<cr>:vertical resize 20<cr>

" Remover Banner da barra lateral
let g:netrw_banner = 0

" Comando para alternar o tamanho do Tab
function! TabSize()
	if &tabstop == 8
		set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
		echo "Tab com 4 espaços"
	else	
		set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
		echo "Tab com 8 espaços"
	endif
endfunction

nnoremap <F12> :call TabSize()<CR>

" Tab com 4 espaços
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set smarttab
set autoindent
set smartindent

" Completar automaticamente ( [ { " ' ` 
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap ` ``<Esc>i

" Identar Automáticamente ( [ { " ' ` 
function! EnterTab()
    let caractere = strpart(getline("."), col(".") - 1, 1)

    if caractere == ")" || caractere == "]" || caractere == "}" || caractere == "<" || caractere == '"' || caractere == "'" || caractere == "`"
        call feedkeys("\<CR>", 'n')
        call feedkeys("\<Up>")
        call feedkeys("\<Esc>")
        call feedkeys('$')
        call feedkeys('i')
        call feedkeys("\<Right>")
        call feedkeys("\<CR>", 'n')

        return ""
    else
        return "\<cr>"
    endif
endfunction

" Faz <Enter> aceitar a sugestão selecionada no coc.nvim
"inoremap <expr> <cr> EnterTab()
inoremap <expr> <cr> pumvisible() ? coc#_select_confirm() : EnterTab()

" Cor no arquivo EJS
autocmd BufNewFile,BufRead *.ejs set filetype=html

" Plugins
call plug#begin('~/.vim/plugged')

" Completar código HTML
Plug 'mattn/emmet-vim'

" Tema Militar
Plug 'mateussantospereira/vim-military'

" Autocompletar
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Cores CSS
Plug 'ap/vim-css-color'

call plug#end()

" Mudar a tecla do Emmet-Vim
inoremap <c-l> <plug>(emmet-expand-abbr)

" Tema Militar
colorscheme military

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
    finish
endif

filetype off
execute pathogen#infect()
filetype plugin indent on

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Enable windows compatibility tweaks
" source $VIMRUNTIME/mswin.vim
" behave mswin

" Behave mswin causes a visual mode selection of text to replace the select
" text with whatever you type.  Disabling this with selectmode="" restores the
" vim behavior.  The downside is that this disables it both in normal mode and
" in insert mode
set selectmode=""

" allow backspacing over everything in insert mode
" This is already enabled via mswin.vim
set backspace=indent,eol,start

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

if has("vms")
    set nobackup	" do not keep a backup file, use versions instead
else
    set backup		" keep a backup file (restore to previous version)

    " Store backups in a shared folder (not in the original folder)
    if has("win32") || has("win64")
        set backupdir=$TEMP,c:\temp,.
    else
        set backupdir=~/tmp,~/,.
    endif

    " Optionally enable persistent undo files
    " set undofile    " keep an undo file (undo changes after closing)
endif

"Enable the swap file
set swapfile

" Default location for the swap file
"  on Windows: ".,$TEMP,c:\tmp,c:\temp"
"  on Unix:    ".,~/tmp,/var/tmp,/tmp"
" Override with set directory=path1,path2

set history=150		" keep 150 lines of command line history
set ruler           " show the cursor position all the time
set showcmd         " show commands as they're typed
set incsearch		" do incremental searching

" This is required for vim-airline to work
set laststatus=2

" View relative line numbers to the left
" set relativenumber

" Simple status line that just shows filename:
" set statusline=%f "tail of the filename

" Detailed status line from got-ravings
" set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

" jamessan's status line
" set statusline=   " clear the statusline for when vimrc is reloaded
" set statusline+=%-3.3n\                      " buffer number
" set statusline+=%f\                          " file name
" set statusline+=%h%m%r%w                     " flags
" set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
" set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
" set statusline+=%{&fileformat}]              " file format
" set statusline+=%=                           " right align
" set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  "highlight
" set statusline+=%b,0x%-8B\                   " current char
" set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

" CTRL+U in insert mode deletes a lot.  Use CTRL-G u to
" create a new undo point prior to performing the requested undo
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, could enable it
" The one downside is inability to highlight text with Putty
" and have that text be placed on the clipboard;
" additionally, right click paste is diabled in Putty when mouse=a is enabled
" if has('mouse')
"     set mouse=a
" endif

" Do not hide the mouse cursor when typing
set nomousehide

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

colorscheme SlateDark

set ignorecase        " Ignore case in regex searches
set smartcase         " Enable case-sensitive search if capitals are present
set nowrap            " Do not wrap lines longer than the window
set guioptions+=b     " Show the horizontal scrollbar

" Imply the use of g when searching (replace all matches on a line).
" When this is enabled, if you use /g, the behavior will switch back to only replacing the first occurrence
set gdefault

" Define the window size
set co=162
set lines=40
set cmdheight=2

set gcr=n-v-c:block-Cursor/lCursor-blinkwait700-blinkoff1000-blinkon1000,ve:ver20-Cursor,o:hor50-Cursorblinkwait700-blinkoff1000-blinkon1000,i-ci:ver25-Cursor/lCursorblinkwait700-blinkoff1000-blinkon1000,r-cr:hor20-Cursor/lCursorblinkwait700-blinkoff1000-blinkon1000,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

set tabstop=4         " Set the tabstop to 4 spaces
set shiftwidth=4      " Shiftwidth should match tabstop
set softtabstop=4

set gfn=consolas:h11  " Consolas, 11 point (guifont)

set scrolloff=3       " Keep 3 lines visible at the top or bottom when scrolling

" Uncomment to enable smart-indenting for all files
" Otherwise, it is extension specific
"set smartindent
"set autoindent

set report=0          " When doing substitutions, report the number of changes

set showmode          " Show Insert or Visual at the bottom
set showcmd           " Show the partial command name at the bottom
set hidden            " Hide buffers closed with :q instead of unloading them
set ttyfast

" Show menu on double-tab command completion;
" for example, type :win then press tab twice
set wildmenu
set wildmode=list:longest,full " Control how 'wildmenu' things are listed

" Uncomment to create undo files (remember undo history even after closing the file)
" set undofile

" Default directory list style
" (0=name only; 1=long, 2=wide (columns), 3=tree)
let g:netrw_liststyle= 1

" Vertical split mode places the directory listing on the left
let g:netrw_altv = 1

" Map shift+Enter to insert a blank link above the cursor
map <S-Enter> O<ESC>

" Unmap Ctrl+y (mapped in mswin.vim)
" unmap <C-Y>

" Could update the / symbol to be /\v
" which enables RegEx mode by default in s/find/replace/ operations
" But this makes it harder to scrollup to see recent / searches, so not
" enabled
nnoremap / /\v
vnoremap / /\v

" Optional: change the default leader from \ to a comma
" By default comma means "repeat the most recent f or t search for a character, looking left"
" Defining the comma as the leader will override the default behavior
" let mapleader = ","
"
" Optional: make Leader then "l" be the same as <Ctrl+w>w  (to move to the next window)
" nmap <leader>l <C-w>w

" Open a vertical split and switch over to the new window (\v or ,v)
nnoremap <leader>v <C-w>v<C-w>l

" Disable highlighting of search matches (temporarily); type \ then a space
nnoremap <leader><space> :noh<cr>

" Create a new tab with <Leader> n or <Leader> t
nnoremap <leader>n :tabnew<CR>
nnoremap <leader>t :tabnew<CR>

" Change all buffers to tabs
" Conversely, show all buffers together with :sball
nnoremap <leader>T :tab sball<CR>

" Shortcut to remove trailing whitespace
" nnoremap <leader>W :%s/\v\s+$//<cr>:let @/=''<CR>
nnoremap <leader>W :%s/\v\s+$//<CR>

" Shortcut to change the working directory
" To see the current working directory, use :cd
nnoremap <leader>O :cd %:p:h<CR>:pwd<CR>

" Add option to press F11 to toggle viewing whitespace chars
" From http://stackoverflow.com/questions/4998582/show-whitespace-characters-in-gvim
noremap <F11> :set list!<CR>:set list?<CR>

" Change n and N (find next/previous match) to center the focus every time
nnoremap n nzz
nnoremap N Nzz

" Change Q to enter Visual Block Mode
nnoremap Q <C-v>

" Optionaly make ; behave like : to make entering commands easier
" Downside is that ; means to repeat the last character search with f
" nnoremap ; :

" Shortcuts for Gundo
nnoremap <F5> :GundoToggle<CR>

" Shortcuts for YankRing
nnoremap <silent> <F3> :YRShow<cr>
inoremap <silent> <F3> <ESC>:YRShow<cr>

" Configure formatting of trailing spaces and tab
" To highligh carriage returns with $ use:
" eol:$
set listchars=tab:>-,trail:.,extends:>,precedes:<,nbsp:_
set nolist

highlight SpecialKey term=standout ctermbg=yellow guibg=yellow
highlight RedundantSpaces term=standout ctermbg=Grey guibg=#ffddcc
call matchadd('RedundantSpaces', '\(\s\+$\| \+\ze\t\|\t\zs \+\)\(\%#\)\@!')

" Split windows below the current window.
set splitbelow

" Abbreviations
iabbrev adn and
iabbrev waht what

" Define a command to add a comma to each line
:command! Comma call CommaJoinLines(0)

" Define a command to surround each line with single quotes, then add a comma
:command! Commaq call CommaJoinLines(1)

" This function is used by Joinc and Joinq
function! CommaJoinLines(addQuotes)
	" Remove blank lines
	:silent g/^\s*$/d

	" Remove trailing whitespace (if any); the e flag means to not issue an
	" error message if the search has no matches
	:silent %s/\v\s+$//e

	if (a:addQuotes != 0)
		" Surround lines with quotes and add a comma
		:silent %s/\v.+/'\0',/
	else
		" Add a comma to each line
		:silent %s/\v.+/\0,/
	endif

	" Remove the final comma
	:silent s/,\s*$//

endfunction

" Only do this part when compiled with support for autocommands.
if has("autocmd")
	if !exists("autocommands_loaded")
		let autocommands_loaded = 1

		" Enable file type detection.
		" Also load indent files, to automatically do language-dependent indenting.
		filetype plugin indent on

		" Make vim turn *off* expandtab for files named Makefile or makefile
		" We need the tab literal
		"
		:autocmd BufNewFile,BufRead [Mm]akefile* set noexpandtab

		" Turn on expandtab for several file types
		:autocmd BufNewFile,BufRead *.conf set expandtab
		:autocmd BufNewFile,BufRead *.cs set expandtab
		:autocmd BufNewFile,BufRead *.java set expandtab
		:autocmd BufNewFile,BufRead *.php set expandtab
		:autocmd BufNewFile,BufRead *.vb set expandtab
		:autocmd BufNewFile,BufRead *.wiki set expandtab

		"
		" Make vim recognize a file ending in ".wiki" be a mediawiki file
		"
		:autocmd BufNewFile,BufRead *.wiki set filetype=mediawiki

		"
		" Make vim recognize a file ending in ".fasta" be a fasta file
		"
		:autocmd BufNewFile,BufRead *.fasta set filetype=proteinFasta

        " Universal syntax coloring for text files
		" Highlights numbers, http, etc.
		" Place the txt.vim file in folder ~/.vim/syntax/
        :autocmd BufNewFile,BufRead *.txt set filetype=txt


		" Disable auto-formatting of comments for all files
		" Change affects both typing and pasting
		:autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
	endif
else

    " always set autoindenting on
    set autoindent

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
    " Prevent that the langmap option applies to characters that result from a
    " mapping.  If unset (default), this may break plugins (but it's backward
    " compatible).
    set langnoremap
endif


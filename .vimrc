syntax on           " syntax highlighting
set textwidth=120   " max line width
set colorcolumn=+1  " colorbar to indicate limit
set number          " show line numbers
set ruler           " show the cursor position all the time

autocmd FileType gitcommit set textwidth=72     " in commit messages, limit to 72
autocmd FileType gitcommit set colorcolumn+=51  " in commit messages, another colorbar at 51 char (for titles)

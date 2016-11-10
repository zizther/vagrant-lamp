syntax on

set laststatus=2                             " always show statusbar 
set statusline=
set statusline+=%-10.3n\                     " buffer number 
set statusline+=%f\                          " filename  
set statusline+=%h%m%r%w                     " status flags 
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type 
set statusline+=%=                           " right align remainder 
set statusline+=0x%-8B                       " character value 
set statusline+=%-14(%l,%c%V%)               " line, character 
set statusline+=%<%P                         " file position 
syntax on
unlet b:current_syntax
"syntax include @SQL syntax/sql.vim
"syntax region sqlSnip matchgroup=Snip start='"""' end='"""' skip='--' contains=@SQL
"hi link Snip String
"hi link sqlSnip String


if status is-interactive
# Commands to run in interactive sessions can go here
end

fzf --fish | source

abbr --add vi 'nvim'
abbr --add vim 'nvim'
abbr --add cat 'bat'
abbr --add tree 'tree --gitignore'
abbr --add today 'nvim ~/notes/daily/$(date --iso).md'

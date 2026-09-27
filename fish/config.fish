if status is-interactive
# Commands to run in interactive sessions can go here
end

function fish_right_prompt -d "Write out the right prompt"
    date '+%m/%d/%y'
end

fzf --fish | source

abbr --add vi 'nvim'
abbr --add vim 'nvim'
abbr --add cat 'bat'
abbr --add tree 'tree --gitignore'
abbr --add today 'nvim ~/notes/daily/$(date --iso).md'

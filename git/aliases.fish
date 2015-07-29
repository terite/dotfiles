# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/

if set --local hub_path (which hub)
  alias git=$hub_path
end

alias s='git status -sb'
alias d='git diff'

# The rest of my fun git aliases
alias gap="git add -p"

alias gcm='git checkout master'
alias gcv='git commit -v'
alias gg='git grep'
alias gp='git push'

# git fetch upstream
alias gfu="git fetch upstream"

# git rebase upstream/master
alias gru="git rebase (git show-ref --hash upstream/master)"

# git branch --merged upstream/master
alias merged="git branch --merged upstream/master"

# get hash for upstream/master
# git show-ref --hash upstream/master

function gco
  command git checkout $argv;
end

function __fish_git_local_branches
  command git branch --no-color ^/dev/null | sgrep -v ' -> ' | sed -e 's/^..//'
end

complete --command gco --no-files --authoritative --arguments '(__fish_git_local_branches)'


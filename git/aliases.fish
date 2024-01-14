alias s='git status -sb'
alias d='git diff'

# The rest of my fun git aliases
alias gap="git add -p"

alias gcm='git checkout master'
alias gcv='git commit -v'
alias gg='git grep'
alias gp='git push -u'

# git fetch upstream
alias gfu="git fetch origin"

# git rebase upstream/master
alias gru="git rebase (git show-ref --hash origin)"

# git branch --merged upstream/master
alias merged="git branch --merged origin"

function gco
  command git checkout $argv;
end

function __fish_git_local_branches
    command git for-each-ref --format='%(refname)' refs/heads/ refs/remotes/ 2>/dev/null \
        | string replace -rf '^refs/heads/(.*)$' '$1\tLocal Branch'
end

complete --command gco --no-files --authoritative --arguments '(__fish_git_local_branches)'


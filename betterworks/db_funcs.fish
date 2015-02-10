alias listdb='psql --no-align --tuples-only --command "SELECT datname FROM pg_database WHERE datistemplate=false"'

alias whichdb='echo $DATABASE_URL'

function setdb
    set --global --export DATABASE_URL "postgresql:/$argv[1]"
end

complete --command setdb \
    --authoritative \
    --no-files \
    --arguments '(listdb)'

function __nth_arg_only
    set cmd (commandline -opc)
    if [ (count $cmd) -eq $argv[1] ]
        return 0
    end
    return 1
end

function copydb
    createdb -T $argv[1] $argv[2]
end

complete --command copydb \
    --authoritative \
    --no-files \
    --arguments '(listdb)' \
    --condition '__nth_arg_only 1'

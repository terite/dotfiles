
function listdb
    psql \
        --no-align \
        --tuples-only \
        --command "SELECT datname FROM pg_database WHERE datistemplate=false" \
    | grep -v "^\\($USER\|postgres\)\$"
end

function whichdb
    echo $DATABASE_URL
end

function setdb
    if [ (count $argv) -ne 1 ]
        echo "Usage: setdb <postgres_db_name>"
        return 1
    end
    set --global --export DATABASE_URL "postgresql:/$argv[1]"
    return 0
end
complete --command setdb \
    --authoritative \
    --no-files \
    --arguments '(listdb)'

alias usedb=setdb
complete --command usedb \
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

complete --command dropdb \
    --no-files \
    --arguments '(listdb)'

alias wb="cd /Volumes/code/BetterWorks"

function tt
    py.test -n0 $argv;
end

complete --command tt \
    --arguments '(find . -name "test_*.py")' \
    --authoritative \
    --no-files

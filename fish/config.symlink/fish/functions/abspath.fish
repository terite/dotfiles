function abspath
    if test -d "$argv"
        pushd "$argv" >/dev/null
        pwd
        popd >/dev/null
    else if test -e "$argv"
        pushd (dirname "$argv") >/dev/null
        echo (pwd)/(basename "$argv")
        popd >/dev/null
    else
        echo "$argv does not exist!" >&2
        return 127
    end
end

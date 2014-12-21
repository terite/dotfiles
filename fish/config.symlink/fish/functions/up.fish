function up --description "Go up 1 directory, N directories, or to a specific directory by name."
    if test -z $argv[1]
        cd ..
    else if test $argv[1] -eq $argv[1]
        set --local i 0
        while true
            if test $i -eq $argv[1]; break; end

            # no point going up past root
            if test (pwd) = "/"; break; end

            cd ..
            set i (math $i + 1)
        end
    else
        set --local upto $argv[1];
        cd (pwd | sed "s/$upto\/.*/$upto/")
    end
end

complete -c up -Afa '(pwd | tr "/" "\n")'

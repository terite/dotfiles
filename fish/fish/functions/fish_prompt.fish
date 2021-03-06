function fish_prompt --description 'Write out the prompt'

	set -l last_status $status

	if not set -q __fish_prompt_normal
		set -g __fish_prompt_normal (set_color normal)
	end

	if not set -q __fish_prompt_cwd
		set -g __fish_prompt_cwd (set_color $fish_color_cwd)
	end

	set -l prompt_status
	if test $last_status -ne 0
		set prompt_status "$__fish_prompt_status [$last_status]$__fish_prompt_normal"
	end

	if set -q SSH_CLIENT
		echo -n -s (set_color white) "$USER@" (hostname) (set_color normal) " "
	end

    if set -q _OLD_FISH_PROMPT_OVERRIDE
        # virtualenv added itself to the prompt, dont re-add it
    else if set -q VIRTUAL_ENV
		echo -n -s (set_color purple) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "

        # I only care about the DB when I'm in a virtual env
        set -l bw_db (whichdb)
        if test $status -eq 0
            echo -n -s (set_color cyan) "($bw_db) " "$__fish_prompt_normal"
        else
            echo -n -s (set_color red) "(no db) " "$__fish_prompt_normal"
        end
	end


	echo -n -s "$__fish_prompt_cwd" (prompt_pwd) (__fish_git_prompt) "$__fish_prompt_normal" "$prompt_status" " ->" ' '
end

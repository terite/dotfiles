if has_command fzf
    if has_command rg
        set -x FZF_DEFAULT_COMMAND 'rg --hidden --files'
    else if has_command ag
        set -x FZF_DEFAULT_COMMAND 'ag --hidden -l -g ""'
    end

    source $HOME/.fzf/shell/key-bindings.fish
    fzf_key_bindings

    # bind \cp '__fzf_ctrl_t'
    # bind \cr '__fzf_ctrl_r'
    # bind \ec '__fzf_alt_c'
end

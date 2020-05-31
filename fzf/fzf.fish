_add_path "$HOME/.fzf/bin"

set -x FZF_DEFAULT_COMMAND 'ag --hidden -l -g ""'

# TODO: remove if unused
bind \cp '__fzf_ctrl_t'
bind \cr '__fzf_ctrl_r'
bind \ec '__fzf_alt_c'

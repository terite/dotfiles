# use ripgrep as the file listing engine
set -x FZF_DEFAULT_COMMAND 'rg --hidden --files'

source $HOME/.fzf/shell/key-bindings.fish
fzf_key_bindings

# bind \cp '__fzf_ctrl_t'
# bind \cr '__fzf_ctrl_r'
# bind \ec '__fzf_alt_c'

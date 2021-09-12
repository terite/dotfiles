_add_path "$HOME/.fzf/bin"

if _has_command ag
  set -x FZF_DEFAULT_COMMAND 'ag --hidden -l -g ""'
else if _has_command rg
  set -x FZF_DEFAULT_COMMAND 'rg --hidden --files'
end

# TODO: remove if unused
bind \cp '__fzf_ctrl_t'
bind \cr '__fzf_ctrl_r'
bind \ec '__fzf_alt_c'

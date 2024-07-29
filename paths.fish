# System
_add_path "$DOTFILES/bin"
_add_path "$HOME/local/bin"
_add_path "$HOME/.local/bin"

# Rust
_add_path "$HOME/.cargo/bin"

# Node
_add_path "$HOME/.npm-packages/bin"

# fzf
_add_path "$HOME/.fzf/bin"

# isolated locals
for path in $HOME/isolocal/*/bin;
  _add_path "$path"
end

function vv
  cd "$HOME/vivaa/$argv"
end

complete --command vv \
    --authoritative \
    --no-files \
    --arguments '(__terite_complete_vv)'

function __terite_complete_vv
  pushd $HOME/vivaa;
  __fish_complete_directories;
  popd
end



set SNAP_DOTNET_ROOT "/snap/dotnet-sdk/current"

if test -f "$SNAP_DOTNET_ROOT/dotnet"
  set --global --export DOTNET_ROOT "$SNAP_DOTNET_ROOT"
  _add_path "$DOTNET_ROOT"

  set DOTNET_VERSION ($DOTNET_ROOT/dotnet --version)
  set --global --export MSBuildSDKsPath "$DOTNET_ROOT/sdk/$DOTNET_VERSION/Sdks"

  _add_path "$HOME/.dotnet/tools"
end


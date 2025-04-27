{ lib, ... }:
{
  home.activation.copyGhostty = lib.hm.dag.entryAfter ["writeBoundary"] ''
    echo "Copying Ghostty configuration..."
    rm -rf "$HOME/.config/ghostty"/*

    if [ ! -d "$HOME/.config/ghostty" ]; then
      mkdir -p "$HOME/.config/ghostty"
    fi

    cp -r ${toString ./ghostty}/* "$HOME/.config/ghostty/"
    chmod -R u+w "$HOME/.config/ghostty"
  '';
}

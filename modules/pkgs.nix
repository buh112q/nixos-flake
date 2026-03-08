{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    fastfetch
    btop
    tree
    bat
    duf
  ];
}

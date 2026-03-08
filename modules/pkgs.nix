{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bat
    btop
    fastfetch
    tree
  ];
}

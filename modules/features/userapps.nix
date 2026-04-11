{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.apps = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      vscodium-fhs
      gearlever
      localsend
      fastfetch
      btop
      fzf
      duf
      tree
    ];
  };
}

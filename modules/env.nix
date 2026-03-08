{
  config,
  lib,
  pkgs,
  ...
}:
{
  environment.variables = {
    QS_ICON_THEME = "Papirus-Dark";
    EDITOR = "micro";
    VISUAL = "micro";
  };
}

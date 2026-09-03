{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    herdr
  ];
}

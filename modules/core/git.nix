{
  config,
  pkgs,
  username,
  ...
}:
{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Sudarsh1010";
      user.email = "sudarshjain1010@gmail.com";
      init.defaultBranch = "dev";
      core.editor = "nvim";
    };
  };
}

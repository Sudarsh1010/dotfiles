{ extraDir, ...}: {
  home.file.".agent-browser" = {
    source = "${extraDir}/.agent-browser";
    recursive = true;
  }; 
}

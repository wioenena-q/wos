{ wos-config, ... }:
let inherit (wos-config.home.git) username email;
in {
  programs.git = {
    enable = true;
    userName = username;
    userEmail = email;
  };
}

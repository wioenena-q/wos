{ ... }: {

  # System config
  # User
  system = {
    exports = [ ]; # Your extra imports.
    user = {
      username = "your-username";
      groups = [ "your-groups" ];
    };
  };

  # Home config
  home = {
    exports = [ ]; # Your extra imports.
    git = {
      username = "your-github-username";
      email = "your-github-email";
    };
  };
}

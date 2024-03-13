{ pkgs, ... }: {
  imports = [ ./init.nix ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      vim-devicons
      {
        plugin = material-nvim;
        config = ''
          :colorscheme material-deep-ocean
        '';
      }
      {
        plugin = nerdtree;
        config = ''
          nnoremap <C-b> :NERDTreeToggle<CR>
        '';
      }
    ];
  };
}

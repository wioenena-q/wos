{ ... }: {
  xdg.configFile."nvim/init.lua".text = ''
    vim.o.backup = false
    vim.o.writebackup = false
    vim.o.swapfile = false
    vim.wo.relativenumber = true
    vim.o.ignorecase = true
    vim.o.smartcase = true
    vim.o.wrap = true 
    vim.o.numberwidth = 3
    vim.o.background = "dark"
    vim.o.highlightsearch = true
    vim.o.tabstop = 2
    vim.o.shiftwidth = 2
    vim.o.smarttab = true
    vim.o.autoindent = true
    vim.o.smartindent = true
    vim.o.foldenable = true
    vim.o.encoding = "utf-8"
    vim.o.fileencoding = "utf-8"
  '';
}

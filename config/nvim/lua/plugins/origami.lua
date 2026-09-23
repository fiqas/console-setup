return {
  {
    "chrisgrieser/nvim-origami",
    event = "BufReadPost",
    opts = {
      keepFoldsAcrossSessions = false,
      pauseFoldsOnSearch = true,
      setupFoldKeymaps = true, -- Maps 'h' to fold and 'l' to unfold
    },
    config = function(_, opts)
      require("origami").setup(opts)

      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.opt.foldlevel = 99
      vim.opt.foldlevelstart = 99
      vim.opt.foldenable = true
    end,
  },
}

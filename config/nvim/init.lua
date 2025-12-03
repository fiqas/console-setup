-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  local result = vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
  if vim.v.shell_error ~= 0 then
    -- stylua: ignore
    vim.api.nvim_echo({ { ("Error cloning lazy.nvim:\n%s\n"):format(result), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
    vim.fn.getchar()
    vim.cmd.quit()
  end
end

vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"

vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"

-- ERRORS AS FLOATING

vim.diagnostic.config {
  virtual_text = false,
}

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

vim.lsp.config("pylsp", {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = { "W391", "E501" },
          maxLineLength = 100,
        },
      },
    },
  },
})

vim.cmd [[

augroup python
        au!
        au BufRead,BufNewFile *.py,*.pyw set tabstop=4
        au BufRead,BufNewFile *.py,*.pyw set shiftwidth=4
        au BufRead,BufNewFile *.py,*.pyw set expandtab
        au BufRead,BufNewFile *.py,*.pyw set softtabstop=4  "Insert 4 spaces when tab is pressed
        au BufRead,BufNewFile *.py,*.pyw set smarttab       "Indent instead of tab at start of line
        au BufRead,BufNewFile *.py,*.pyw set shiftround     "Round spaces to nearest shiftwidth multiple
        au BufRead,BufNewFile *.py,*.pyw set colorcolumn=80 "Color last legal column

augroup end

augroup c++
        au!
        au BufRead,BufNewFile *.cpp,*.hpp set tabstop=2
        au BufRead,BufNewFile *.cpp,*.hpp set shiftwidth=2
        au BufRead,BufNewFile *.cpp,*.hpp set expandtab
        au BufRead,BufNewFile *.cpp,*.hpp set softtabstop=2  "Insert 4 spaces when tab is pressed
        au BufRead,BufNewFile *.cpp,*.hpp set smarttab       "Indent instead of tab at start of line
        au BufRead,BufNewFile *.cpp,*.hpp set shiftround     "Round spaces to nearest shiftwidth multiple
        au BufRead,BufNewFile *.cpp,*.hpp set colorcolumn=80 "Color last legal column

augroup end

augroup c
        au!
        au BufRead,BufNewFile *.c,*.h set tabstop=2
        au BufRead,BufNewFile *.c,*.h set shiftwidth=2
        au BufRead,BufNewFile *.c,*.h set expandtab
        au BufRead,BufNewFile *.c,*.h set softtabstop=2  "Insert 4 spaces when tab is pressed
        au BufRead,BufNewFile *.c,*.h set smarttab       "Indent instead of tab at start of line
        au BufRead,BufNewFile *.c,*.h set shiftround     "Round spaces to nearest shiftwidth multiple
        au BufRead,BufNewFile *.c,*.h set colorcolumn=80 "Color last legal column

augroup end


]]

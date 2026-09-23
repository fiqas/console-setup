-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 },
      autopairs = true,
      cmp = true,
      diagnostics = { virtual_text = true, virtual_lines = false },
      highlighturl = true,
      notifications = true,
    },
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    options = {
      opt = {
        relativenumber = true,
        number = true,
        spell = false,
        signcolumn = "yes",
        wrap = false,

        -- Folding settings
        foldenable = true,
        foldlevel = 0,
        foldlevelstart = 0,
        foldcolumn = "1",
      },
      g = {},
    },
    -- Autocommands to enforce folding on file open
    autocmds = {
      auto_fold_on_open = {
        {
          event = "BufReadPost",
          desc = "Force foldlevel to 0 after buffer loads",
          callback = function()
            vim.opt_local.foldlevel = 0
            vim.opt_local.foldlevelstart = 0
          end,
        },
      },
    },
    mappings = {
      n = {
        -- Smart double space: fold/unfold ONLY the current function or block under cursor
        ["<Leader><Leader>"] = {
          function()
            local foldlevel = vim.fn.foldclosed "."
            if foldlevel == -1 then
              -- If the current line is open, create/close a fold for this block only
              vim.cmd "normal! zc"
            else
              -- If the line is folded, recursively open this block and its children
              vim.cmd "normal! zA"
            end
          end,
          desc = "Toggle fold for target function/block",
        },

        -- Space + A to unfold EVERYTHING in the file
        ["<Leader>A"] = { "zR", desc = "Unfold all in buffer" },

        -- Space + M to fold EVERYTHING in the file
        ["<Leader>M"] = { "zM", desc = "Fold all in buffer" },

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },
      },
    },
  },
}

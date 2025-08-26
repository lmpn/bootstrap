-- create a loop over an array and count its len

return {

  -- codeium
  {
    "Exafunction/windsurf.vim",
    cmd = "Codeium",
    event = "BufEnter",
    build = ":Codeium Auth",
    -- opts = {
    --   enable_cmp_source = vim.g.ai_cmp,
    --   virtual_text = {
    --     enabled = not vim.g.ai_cmp,
    --     key_bindings = {
    --       accept = false, -- handled by nvim-cmp / blink.cmp
    --       next = "<M-]>",
    --       prev = "<M-[>",
    --     },
    --   },
    -- },
  },

  -- codeium cmp source
  {
    "hrsh7th/nvim-cmp",
    optional = true,
    dependencies = { "windsurf.vim" },
    opts = function(_, opts)
      table.insert(opts.sources, 1, {
        name = "codeium",
        group_index = 1,
        priority = 100,
      })
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, 2, LazyVim.lualine.cmp_source("codeium"))
    end,
  },

  vim.g.ai_cmp and {
    "saghen/blink.cmp",
    optional = true,
    dependencies = { "windsurf.vim", "saghen/blink.compat" },
    opts = {
      sources = {
        compat = { "codeium" },
        providers = {
          codeium = {
            kind = "Codeium",
            score_offset = 100,
            async = true,
          },
        },
      },
    },
  },
}

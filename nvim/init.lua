-- default config
vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/site")

require("config.lazy")

vim.wo.number = true

local telescope = require('telescope')
--local haskell_snippets = require('haskell-snippets').all

-- Lazy.nvim:
--require('lazy').setup({
--    -- your other plugins
--    
--    -- this theme
--    {
--        "Mofiqul/adwaita.nvim",
--        lazy = false,
--        priority = 1000,
--    },
--})

vim.cmd.colorscheme "catppuccin"

require("catppuccin").setup({
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
--    background = { -- :h background
--        light = "latte",
--        dark = "mocha",
--    },
    transparent_background = false, -- disables setting the background color.
    float = {
        transparent = false, -- enable transparent floating windows
        solid = false, -- use solid styling for floating windows, see |winborder|
    },
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    color_overrides = {},
    custom_highlights = {},
    default_integrations = true,
    auto_integrations = false,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
nvimTree = require("nvim-tree")
nvimTreeAPI = require("nvim-tree.api")

-- OR setup with some options
nvimTree.setup {
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
}

vim.keymap.set('n', '<C-n>', nvimTreeAPI.tree.toggle, opts)

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"

telescope.setup {
    defaults = {
        preview = {
            treesitter = false,
        }
    }
}

telescope.load_extension('manix')

require("lazy").setup({{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  branch = 'main',
  config = function ()
    local ts_langs = {
      "asm", "c", "lua", "vim", "vimdoc", "rust", "haskell",
      "python", "nix", "javascript", "typescript", "tsx",
      "html", "css", "idris", "jinja", "markdown", "markdown_inline",
      "latex", "yaml", "html", "css", "c++"
    }

    -- new main-branch API: replaces configs.setup({ ensure_installed = ... })
    require("nvim-treesitter").install(ts_langs)

    -- new main-branch API: highlighting is no longer a config flag,
    -- it has to be started per-buffer via vim.treesitter.start()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = ts_langs,
      callback = function()
        vim.treesitter.start()
        vim.wo.foldmethod = "expr"
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      end,
    })
  end
}})

--require("lazy").setup({{
--    "nvim-treesitter/nvim-treesitter",
--    build = ":TSUpdate",
--    branch = 'main',
--    config = function ()
--        local configs = require("nvim-treesitter.configs")
--
--        configs.setup({
--            ensure_installed = {
--                "asm",
--                "c",
--                "lua",
--                "vim",
--                "vimdoc",
--                "rust",
--                "haskell",
--                "python",
--                "nix",
--                "javascript",
--                "typescript",
--                "tsx",
--                "html",
--                "css",
--                "idris",
--                "jinja",
--                "markdown",
--                "markdown_inline",
--            },
--            sync_install = false,
--            highlight = { enable = true },
--            indent = { enable = true },
--        })
--    end
--}})

local ht = require('haskell-tools')
local bufnr = vim.api.nvim_get_current_buf()
local opts = { noremap = true, silent = true, buffer = bufnr, }
-- haskell-language-server relies heavily on codeLenses,
-- so auto-refresh (see advanced configuration) is enabled by default
vim.keymap.set('n', '<space>cl', vim.lsp.codelens.run, opts)
-- Evaluate all code snippets
vim.keymap.set('n', '<space>ea', ht.lsp.buf_eval_all, opts)
-- Toggle a GHCi repl for the current package
vim.keymap.set('n', '<leader>rr', ht.repl.toggle, opts)
-- Toggle a GHCi repl for the current buffer
vim.keymap.set('n', '<leader>rf', function()
  ht.repl.toggle(vim.api.nvim_buf_get_name(0))
end, opts)
vim.keymap.set('n', '<leader>rq', ht.repl.quit, opts)
vim.keymap.set('n', '<space>a', '<Plug>HaskellHoverAction')

require('neotest').setup {
  -- ...,
  adapters = {
    -- ...,
    require('neotest-haskell')
  },
}

vim.opt.signcolumn = 'yes'

require("fidget").setup{}

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end,
})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

vim.lsp.config('hls', {
  filetypes = { 'haskell', 'lhaskell', 'cabal' },
})

vim.lsp.config('rust_analyzer', {
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false;
      }
    }
  }
})

vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
  pattern = "*.hs",
  callback = function()
    vim.b.matchup_matchparen_enabled = 0
  end,
})

require("luasnip.loaders.from_vscode").lazy_load()
local luasnip = require("luasnip")
-- cmp language server protocol integration
local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'nvim_lua' },
  },

  mapping = cmp.mapping.preset.insert({
 -- Jump to the next snippet placeholder
    ['<C-f>'] = cmp.mapping(function(fallback)
      local luasnip = require('luasnip')
      if luasnip.locally_jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, {'i', 's'}),
    -- Jump to the previous snippet placeholder
    ['<C-b>'] = cmp.mapping(function(fallback)
      local luasnip = require('luasnip')
      if luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {'i', 's'}),
        -- scroll up and down the documentation window
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ["<Tab>"] = cmp.mapping(function(fallback)
      -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
      if cmp.visible() then
        local entry = cmp.get_selected_entry()
        if not entry then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        end
        cmp.confirm()
      else
        fallback()
      end
    end, {"i","s",}),
  }),
  formatting = {
          -- changing the order of fields so the icon is the first
    fields = {'menu', 'abbr', 'kind'},

    -- here is where the change happens
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'λ',
        luasnip = '⋗',
        buffer = 'Ω',
        path = '',
        nvim_lua = 'Π',
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
})

local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "rounded",
  },
})

vim.keymap.set("n", "<leader>gg", function()
  lazygit:toggle()
end, {
  noremap = true,
  silent = true,
  desc = "Toggle Lazygit",
})

vim.api.nvim_exec([[
runtime init.nvim
    ]], false
)

require("toggleterm").setup{
  open_mapping = [[<c-\>]],
}


local highlight = {
    "RainbowRed",
    "RainbowOrange",
    "RainbowYellow",
    "RainbowGreen",
    "RainbowBlue",
    "RainbowViolet",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
end)

vim.g.rainbow_delimiters = { highlight = highlight }

hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

require("ibl").setup { indent = { highlight = highlight } }

local dap = require("dap")
local dapui = require("dapui")

dapui.setup()

dap.set_log_level("TRACE")

-- Open/close DAP UI automatically
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end

dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end

dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end

dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<F10>", dap.step_over)
vim.keymap.set("n", "<F11>", dap.step_into)
vim.keymap.set("n", "<F12>", dap.step_out)

vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<Leader>B", function()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)

vim.keymap.set("n", "<Leader>du", dapui.toggle)

-----------------------------------------------------------
-- C / C++ / Rust
-----------------------------------------------------------

dap.adapters.lldb = {
  type = "executable",
  command = "lldb-dap",
}

local lldb_config = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",

    program = function()
      return vim.fn.input(
        "Path to executable: ",
        vim.fn.getcwd() .. "/",
        "file"
      )
    end,

    cwd = "${workspaceFolder}",
    stopOnEntry = true,
  },
}

dap.configurations.c = lldb_config
dap.configurations.cpp = lldb_config
dap.configurations.rust = lldb_config


-----------------------------------------------------------
-- Python
-----------------------------------------------------------

dap.adapters.python = {
  type = "executable",
  command = "python",
  args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
  {
    name = "Launch file",
    type = "python",
    request = "launch",

    program = "${file}",

    pythonPath = function()
      return vim.fn.exepath("python")
    end,
  },
}


-----------------------------------------------------------
-- JavaScript / TypeScript
-----------------------------------------------------------

dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",

  executable = {
    command = "js-debug-adapter",
    args = {
      "${port}",
    },
  },
}

local js_config = {
  {
    name = "Launch file",
    type = "pwa-node",
    request = "launch",

    program = "${file}",
    cwd = "${workspaceFolder}",
  },
}

dap.configurations.javascript = js_config
dap.configurations.typescript = js_config
dap.configurations.javascriptreact = js_config
dap.configurations.typescriptreact = js_config


-----------------------------------------------------------
-- OCaml
-----------------------------------------------------------

dap.adapters.ocaml = {
  type = "executable",
  command = "ocamlearlybird",
}

dap.configurations.ocaml = {
  {
    name = "Launch OCaml program",
    type = "ocaml",
    request = "launch",

    program = function()
      return vim.fn.input(
        "Path to executable: ",
        vim.fn.getcwd() .. "/",
        "file"
      )
    end,
  },
}

-- Notes Taking

-----------------------------------------------------------
-- Obsidian (obsidian.nvim)
-----------------------------------------------------------
 
require("obsidian").setup({
  legacy_commands = false, -- use the new :Obsidian subcommands instead of :ObsidianX
  ui = { enable = false },
 
  workspaces = {
    {
      name = "personal",
      -- CHANGE THIS to the actual path of your Obsidian vault
      path = "~/vaults/",
    },
  },
 
  -- optional, completion of wiki links, tags, etc. via nvim-cmp / blink.cmp
  completion = {
    nvim_cmp = true,
    min_chars = 2,
  },
 
  -- where daily notes go
  daily_notes = {
    folder = "dailies",
    date_format = "%Y-%m-%d",
    template = nil,
  },
})


local obs_opts = { noremap = true, silent = true }
 
-- Open the current vault in the Obsidian app
vim.keymap.set("n", "<leader>oo", "<cmd>Obsidian open<cr>", obs_opts)
-- Create a new note
vim.keymap.set("n", "<leader>on", "<cmd>Obsidian new<cr>", obs_opts)
-- Fuzzy-find and open a note by title
vim.keymap.set("n", "<leader>oq", "<cmd>Obsidian quick_switch<cr>", obs_opts)
-- Full-text search across the vault
vim.keymap.set("n", "<leader>os", "<cmd>Obsidian search<cr>", obs_opts)
-- Show backlinks to the note under the cursor
vim.keymap.set("n", "<leader>ob", "<cmd>Obsidian backlinks<cr>", obs_opts)
-- List/search tags
vim.keymap.set("n", "<leader>ot", "<cmd>Obsidian tags<cr>", obs_opts)
-- Insert a template into the current note
vim.keymap.set("n", "<leader>oT", "<cmd>Obsidian template<cr>", obs_opts)
-- Open/create today's daily note
vim.keymap.set("n", "<leader>od", "<cmd>Obsidian today<cr>", obs_opts)
-- Open/create yesterday's daily note
vim.keymap.set("n", "<leader>oy", "<cmd>Obsidian yesterday<cr>", obs_opts)
-- Rename the current note (updates links across the vault)
vim.keymap.set("n", "<leader>or", "<cmd>Obsidian rename<cr>", obs_opts)
-- Toggle a markdown checkbox on the current line
vim.keymap.set("n", "<leader>oc", "<cmd>Obsidian toggle_checkbox<cr>", obs_opts)
-- Paste an image from the clipboard into the note
vim.keymap.set("n", "<leader>op", "<cmd>Obsidian paste_img<cr>", obs_opts)
-- Follow the link under the cursor
vim.keymap.set("n", "gf", "<cmd>Obsidian follow_link<cr>", obs_opts)
-- Turn the visually selected text into a [[link]]
vim.keymap.set("v", "<leader>ol", "<cmd>Obsidian link<cr>", obs_opts)
-- Turn the visually selected text into a link to a brand-new note
vim.keymap.set("v", "<leader>oL", "<cmd>Obsidian link_new<cr>", obs_opts)

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_us"
  end,
})

-- require("image").setup({
--   backend = "kitty",
--   integrations = {
--     markdown = {
--       enabled = true,
--       clear_in_insert_mode = false,
--       download_remote_images = true,
--       only_render_image_at_cursor = false,
--       filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
--     },
--     neorg = {
--       enabled = true,
--       clear_in_insert_mode = false,
--       download_remote_images = true,
--       only_render_image_at_cursor = false,
--       filetypes = { "norg" },
--     },
--     html = {
--       enabled = false,
--     },
--     css = {
--       enabled = false,
--     },
--   },
--   max_width = nil,
--   max_height = nil,
--   max_width_window_percentage = nil,
--   max_height_window_percentage = 50,
--   window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
--   window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
--   editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
--   tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
--   hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
-- })


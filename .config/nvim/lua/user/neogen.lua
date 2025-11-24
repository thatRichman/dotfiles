-- Neogen configuration for Lazy.nvim with Rust, Python, and Java support
return {
  "danymat/neogen",
  version = "*",                     -- Use the latest stable version
  ft = { "rust", "python", "java", "bash" }, -- Load only for these filetypes
  opts = {
    enabled = true,
    input_after_comment = true, -- Automatically enter insert mode after generating comment

    -- Languages configuration
    templates = {
      rust = {
        annotation_convention = "rust_doc" -- Use Rust doc comment style (///)
      },
      python = {
        annotation_convention = "google_docstrings" -- Use Google style docstrings
      },
      java = {
        annotation_convention = "javadoc" -- Use JavaDoc style
      },
      bash = {
        annotation_convention = "google_bash" -- Use JavaDoc style
      }
    }
  },
  keys = {
    -- Keybindings for documentation generation
    { "<leader>nf", function() require("neogen").generate({ type = "func" }) end,  desc = "Generate function documentation" },
    { "<leader>nc", function() require("neogen").generate({ type = "class" }) end, desc = "Generate class documentation" },
    { "<leader>nt", function() require("neogen").generate({ type = "type" }) end,  desc = "Generate type documentation" },
    { "<leader>nF", function() require("neogen").generate({ type = "file" }) end,  desc = "Generate file documentation" },
  },
  config = function(_, opts)
    require("neogen").setup(opts)

    -- Set filetype-specific configurations
    -- You can add more specific settings per filetype if needed
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "rust",
      callback = function()
        -- Special configuration for Rust files
        vim.keymap.set("n", "<leader>nm", function()
          require("neogen").generate({ type = "impl" })
        end, { buffer = true, desc = "Generate impl documentation" })
      end,
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "python",
      callback = function()
        -- Special configuration for Python files
        vim.keymap.set("n", "<leader>nm", function()
          require("neogen").generate({ type = "module" })
        end, { buffer = true, desc = "Generate module documentation" })
      end,
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "java",
      callback = function()
        -- Special configuration for Java files
        vim.keymap.set("n", "<leader>ni", function()
          require("neogen").generate({ type = "interface" })
        end, { buffer = true, desc = "Generate interface documentation" })
      end,
    })
  end,
}

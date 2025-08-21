{ inputs, ... }: {
  
  imports = [inputs.nixvim.homeModules.nixvim];

  programs.nixvim = {
    enable = true;
    
    # Basic settings
    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
      wrap = false;
      cursorline = true;
    };
    
    globals = {
      mapleader = " ";
    };
    
    # Essential keymaps
    keymaps = [
      { mode = "n"; key = "<leader>w"; action = ":w<CR>"; options.desc = "Save"; }
      { mode = "n"; key = "<leader>q"; action = ":q<CR>"; options.desc = "Quit"; }
      
      # Markdown
      { mode = "n"; key = "<leader>mp"; action = ":MarkdownPreview<CR>"; options.desc = "Start markdown preview"; }
      
      # LaTeX (simplified)
      { mode = "n"; key = "<leader>lc"; action = ":VimtexCompile<CR>"; options.desc = "Compile LaTeX"; }
    ];
    
    plugins = {
      # Markdown preview
      markdown-preview = {
        enable = true;
        settings = {
          auto_start = 0; # Don't start automatically
        };
      };
      
      # LaTeX support (VimTeX - simplified)
      vimtex = {
        enable = true;
        settings = {
          compiler_method = "latexmk";
          quickfix_mode = 0; # Don't auto-open quickfix window
        };
      };
      
      # Better syntax highlighting for LaTeX
      treesitter = {
        enable = true;
        nixvimInjections = true;
      };
      
      # Status line (lualine)
      lualine = {
        enable = true;
        settings = {
          options = {
            theme = "ayu_dark";  # Matches your Ayu theme
            section_separators = "";
            component_separators = "";
          };
        };
      };
      
      # Autocomplete (nvim-cmp)
      cmp = {
        enable = true;
        settings = {
          mapping = {
            "<Tab>" = "cmp.mapping.select_next_item()";
            "<S-Tab>" = "cmp.mapping.select_prev_item()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
          };
          sources = [
            { name = "buffer"; }  # Suggest words from the current buffer
            { name = "path"; }    # Suggest file paths
            { name = "nvim_lsp"; }  # For LaTeX commands (via LSP)
          ];
        };
      };
    };
    
    # Ayu colorscheme
    colorschemes = {
      ayu = {
        enable = true;
        settings = {
          mirage = false; # Use dark variant
          transparent = true; # Enable transparency
        };
      };
    };
    
    # LaTeX and document-specific settings (simplified)
    extraConfigLua = ''
      -- Enable transparency (inherit from terminal)
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      
      -- Enable spell checking for LaTeX and Markdown
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {"tex", "latex", "markdown"},
        callback = function()
          vim.opt_local.spell = true
          vim.opt_local.spelllang = "en_us"
          vim.opt_local.wrap = true  -- Enable word wrap for documents
        end,
      })
      
      -- LaTeX-specific indentation
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {"tex", "latex"},
        callback = function()
          vim.opt_local.tabstop = 2
          vim.opt_local.shiftwidth = 2
        end,
      })
      
      -- Spellcheck for the whole document
      -- Function to start guided spellcheck
      function SpellcheckDocument()
        vim.cmd("normal! gg")  -- Go to the start of the document
        while true do
          vim.cmd("normal! ]s")  -- Jump to next misspelled word
          local word = vim.fn.expand("<cword>")
          if word == "" then break end  -- Stop if no more misspelled words
          local choice = vim.fn.input("Fix word '" .. word .. "'? (y/n/a): ")
          if choice == "y" then
            vim.cmd("normal! z=")  -- Show suggestions
          elseif choice == "a" then
            vim.cmd("normal! zg")  -- Add to dictionary
          elseif choice == "n" then
            vim.cmd("normal! 1zv")  -- Skip
          else
            break
          end
        end
      end

      -- Map to start spellcheck
      vim.api.nvim_set_keymap("n", "<leader>sc", ":lua SpellcheckDocument()<CR>", { noremap = true, silent = true })
    '';
  };
}

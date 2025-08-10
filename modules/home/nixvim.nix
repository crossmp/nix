{ inputs, ... }: {
  
  imports = [inputs.nixvim.homeModules.nixvim];

  programs.nixvim = {
    enable = true;
    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
      smartindent = true;
      expandtab = true;
      wrap = false;
      ignorecase = true;
      smartcase = true;
      cursorline = true;
      signcolumn = "yes";
      updatetime = 300;
      timeoutlen = 500;
    };
    
    globals = {
      mapleader = " "; # Space as leader key
    };
    
    keymaps = [
      # File tree toggle
      { mode = "n"; key = "<leader>e"; action = ":NvimTreeToggle<CR>"; options.desc = "Toggle file tree"; }
      
      # Quick save/quit
      { mode = "n"; key = "<leader>w"; action = ":w<CR>"; options.desc = "Save file"; }
      { mode = "n"; key = "<leader>q"; action = ":q<CR>"; options.desc = "Quit"; }
      
      # Buffer navigation
      { mode = "n"; key = "<Tab>"; action = ":bnext<CR>"; options.desc = "Next buffer"; }
      { mode = "n"; key = "<S-Tab>"; action = ":bprev<CR>"; options.desc = "Previous buffer"; }
      { mode = "n"; key = "<leader>bd"; action = ":bdelete<CR>"; options.desc = "Delete buffer"; }
      
      # Split navigation (matching tmux)
      { mode = "n"; key = "<C-h>"; action = "<C-w>h"; options.desc = "Go to left window"; }
      { mode = "n"; key = "<C-l>"; action = "<C-w>l"; options.desc = "Go to right window"; }
      { mode = "n"; key = "<C-j>"; action = "<C-w>j"; options.desc = "Go to lower window"; }
      { mode = "n"; key = "<C-k>"; action = "<C-w>k"; options.desc = "Go to upper window"; }
      
      # Resize windows
      { mode = "n"; key = "<C-Up>"; action = ":resize +2<CR>"; options.desc = "Increase window height"; }
      { mode = "n"; key = "<C-Down>"; action = ":resize -2<CR>"; options.desc = "Decrease window height"; }
      { mode = "n"; key = "<C-Left>"; action = ":vertical resize -2<CR>"; options.desc = "Decrease window width"; }
      { mode = "n"; key = "<C-Right>"; action = ":vertical resize +2<CR>"; options.desc = "Increase window width"; }
      
      # Code formatting
      { mode = "n"; key = "<leader>f"; action = ":lua vim.lsp.buf.format()<CR>"; options.desc = "Format code"; }
      
      # LSP keymaps
      { mode = "n"; key = "gd"; action = ":lua vim.lsp.buf.definition()<CR>"; options.desc = "Go to definition"; }
      { mode = "n"; key = "gr"; action = ":lua vim.lsp.buf.references()<CR>"; options.desc = "Go to references"; }
      { mode = "n"; key = "K"; action = ":lua vim.lsp.buf.hover()<CR>"; options.desc = "Hover documentation"; }
      { mode = "n"; key = "<leader>rn"; action = ":lua vim.lsp.buf.rename()<CR>"; options.desc = "Rename symbol"; }
      { mode = "n"; key = "<leader>ca"; action = ":lua vim.lsp.buf.code_action()<CR>"; options.desc = "Code action"; }
    ];
    plugins = {
      # Status line (keeping it simple)
      lualine = {
        enable = true;
        settings = {
          options = {
            theme = "kanagawa";
            section_separators = { left = ""; right = ""; };
            component_separators = { left = ""; right = ""; };
          };
        };
      };
      
      # File tree
      nvim-tree = {
        enable = true;
        settings = {
          disable_netrw = true;
          hijack_netrw = true;
          view = {
            width = 30;
            side = "left";
          };
        };
      };
      
      # Fuzzy finder (ESSENTIAL for productivity)
      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = "find_files";
          "<leader>fg" = "live_grep";
          "<leader>fb" = "buffers";
          "<leader>fh" = "help_tags";
        };
      };
      
      # Git integration
      gitsigns.enable = true;
      
      # Auto-completion
      nvim-cmp = {
        enable = true;
        settings = {
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.close()";
            "<Tab>" = "cmp.mapping.select_next_item()";
            "<S-Tab>" = "cmp.mapping.select_prev_item()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
          };
          sources = [
            { name = "nvim_lsp"; }
            { name = "buffer"; }
            { name = "path"; }
          ];
        };
      };
      
      # Language Server Protocol (LSP) - for Python/C++
      lsp = {
        enable = true;
        servers = {
          # Python
          pyright.enable = true;
          
          # C++
          clangd.enable = true;
          
          # Markdown/LaTeX for university
          marksman.enable = true; # Markdown
          ltex = {
            enable = true; # Grammar/spell checking
            settings = {
              language = "en-US";
              checkFrequency = "save";
            };
          };
        };
      };
      
      # Code formatting
      conform-nvim = {
        enable = true;
        settings = {
          formatters_by_ft = {
            python = [ "black" "isort" ];
            cpp = [ "clang-format" ];
            markdown = [ "prettier" ];
          };
          format_on_save = {
            timeout_ms = 500;
            lsp_fallback = true;
          };
        };
      };
      
      # Better syntax highlighting
      treesitter = {
        enable = true;
        settings = {
          ensure_installed = [ "python" "cpp" "markdown" "latex" "bash" "nix" ];
          highlight.enable = true;
          indent.enable = true;
        };
      };
    };
    colorschemes = {
      kanagawa = {
        enable = true;
        settings = {
          compile = false;
          undercurl = true;
          commentStyle = { italic = true; };
          functionStyle = { bold = true; };
          keywordStyle = { italic = true; };
          statementStyle = { bold = true; };
          typeStyle = {};
          transparent = false;
          dimInactive = false;
          terminalColors = true;
          theme = "wave"; # wave, dragon, lotus
        };
      };
    };
    extraConfigLua = ''
      vim.cmd([[syntax on]])
      vim.cmd([[filetype plugin indent on]])
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function() vim.opt_local.spell = true end,
      })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "tex",
        callback = function() vim.opt_local.spell = true end,
      })
    '';
  };
}

{ pkgs, hostname, ... }: 
{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Development essentials
    git
    
    # Python development
    python3
    pyright          # Python LSP
    black            # Python formatter
    isort            # Python import sorter
    
    # C++ development  
    gcc              # C++ compiler
    clang-tools      # C++ LSP and formatter
    cmake            # Build system
    
    # General development
    nodejs           # For various LSPs
    
    # Markdown/LaTeX (for university)
    marksman         # Markdown LSP
    ltex-ls          # Grammar/spell checker
    pandoc           # Document converter
    
    # System monitoring/info
    btop
    bat              # Better cat
    neofetch
    
    # File management
    fd               # Better find
    ripgrep          # Better grep (for telescope)
    fzf              # Fuzzy finder
  ];
}

{ pkgs, hostname, ... }: 
{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Essentials
    git
    nodejs           # For markdown preview
    bat              # Better cat
    neofetch
    yazi             # File manager
    
    # LaTeX essentials
    texliveFull      # Complete LaTeX distribution (includes latexmk)
    # Using Firefox for PDF viewing (like markdown preview)
  ];
}

# My NixOS Configuration

A unified NixOS flake configuration supporting multiple hosts with consistent theming and development tools.

## 🖥️ Hosts

| Host | User | Purpose | Status |
|------|------|---------|--------|
| `nixos` | `nixos` | WSL Development Environment | ✅ Active |
| `nixos-laptop` | `matt` | Laptop with Hyprland Desktop | 🚧 Setup |
| `nixos-server` | `matt` | Headless Server | 🚧 Setup |

## 🎨 Theme

**Kanagawa** - A high-contrast, clean color scheme inspired by Japanese traditional colors
- Dark background with bright, distinct syntax highlighting
- Consistent across tmux, zsh, and nixvim
- Optimized for long coding sessions

## 🛠️ Development Setup

### Languages Supported
- **Python** (pyright LSP, black formatter, isort)
- **C++** (clangd LSP, clang-format)
- **Markdown** (marksman LSP, prettier formatter)
- **LaTeX** (ltex LSP for grammar/spell checking)

### Key Tools
- **Editor**: Nixvim with LSP, Telescope, Tree-sitter
- **Terminal**: Tmux with session persistence
- **Shell**: Zsh with syntax highlighting and git integration
- **Version Control**: Git with helpful aliases

## 🚀 Quick Start

### Rebuild System
```bash
rebuild              # Current host system
home-rebuild         # Current host home-manager
```

### Rebuild Specific Host
```bash
sudo nixos-rebuild switch --flake ~/nix#<hostname>
home-manager switch --flake ~/nix#<user>@<hostname>
```

### Cleanup
```bash
gc                   # Garbage collect old generations
clean                # Deep clean nix store
```

## 📂 Structure

```
├── flake.nix                 # Main flake configuration
├── hosts/                    # Host-specific configurations
│   ├── nixos/               # WSL host
│   ├── nixos-laptop/        # Laptop host  
│   └── nixos-server/        # Server host
├── modules/
│   ├── nixos/               # System-level modules
│   └── home/                # Home-manager modules
└── assets/                  # Wallpapers and resources
```

## 🔧 Key Features

### Shell & Terminal
- **Tmux**: Auto-launch with session persistence
- **Zsh**: Custom prompt with git branch display
- **Aliases**: Productivity shortcuts for git, python, navigation

### Editor (Nixvim)
- **LSP**: Language servers for Python, C++, Markdown
- **Telescope**: Fuzzy finder for files and grep
- **Tree-sitter**: Enhanced syntax highlighting
- **Auto-formatting**: On save for all supported languages

### WSL Optimizations
- **VS Code Integration**: `nix-ld` for extension compatibility
- **Shell Integration**: Smart tmux launching (disabled in VS Code)
- **Windows Alacritty**: Kanagawa theme configuration

## 📝 Usage Notes

### Adding Packages
- **System packages**: Edit `hosts/*/local-packages.nix`
- **User packages**: Edit `hosts/*/home-packages.nix`

### Creating Modules
- **System modules**: Add to `modules/nixos/`
- **Home modules**: Add to `modules/home/`

### Git Workflow
```bash
g                    # git
ga .                 # git add .
gc "message"         # git commit -m "message"
gp                   # git push
gs                   # git status
```

### Python Development
```bash
py                   # python3
pip install package  # python3 -m pip install package
venv myenv           # python3 -m venv myenv
```

## 🔍 Verification

Run the verification script to check system health:
```bash
./verify-system.sh
```

## 🎯 Development Goals

- **Learning**: Python (intermediate) → C++ (beginner) → Quantitative Finance
- **Academic**: Markdown and LaTeX for university assignments and dissertation
- **Consistency**: Unified theming and keybinds across all tools
- **Productivity**: Efficient development environment for coding and research

---

*Built with NixOS ❄️ | Themed with Kanagawa 🌊*

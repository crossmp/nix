#!/usr/bin/env bash

echo "=== NixOS Configuration Verification ==="
echo

# Check flake structure
echo "📁 Checking flake structure..."
if [ -f "flake.nix" ]; then
    echo "✅ flake.nix exists"
else
    echo "❌ flake.nix missing"
    exit 1
fi

# Extract and display host configurations
echo
echo "🏠 Host configurations found:"
grep -A 5 "nixosConfigurations" flake.nix | grep -E "(nixos|nixos-laptop|nixos-server)" | sed 's/.*= /  • /'

echo
echo "👤 Home-manager configurations found:"
grep -A 10 "homeConfigurations" flake.nix | grep -E "matt@" | sed 's/.*"/  • /' | sed 's/" = .*//'

# Check each host's variables
echo
echo "🔍 Verifying host/user variable mappings..."
echo

for host in nixos nixos-laptop nixos-server; do
    if [ -d "hosts/$host" ]; then
        echo "Host: $host"
        
        # Check if host config exists
        if [ -f "hosts/$host/default.nix" ]; then
            echo "  ✅ System config exists"
        else
            echo "  ❌ System config missing"
        fi
        
        # Check if home config exists
        if [ -f "hosts/$host/home.nix" ]; then
            echo "  ✅ Home config exists"
        else
            echo "  ❌ Home config missing"
        fi
        
        # Check for WSL-specific config
        if [ "$host" = "nixos" ]; then
            if grep -q "wsl = {" "hosts/$host/default.nix" && grep -q "enable = true;" "hosts/$host/default.nix"; then
                echo "  ✅ WSL enabled"
            else
                echo "  ⚠️  WSL not enabled"
            fi
        fi
        
        echo
    else
        echo "❌ Host directory $host not found"
        echo
    fi
done

# Check module structure
echo "📦 Checking module structure..."
if [ -d "modules/nixos" ]; then
    echo "  ✅ NixOS modules directory exists"
    echo "  📄 NixOS modules: $(ls modules/nixos/ | tr '\n' ' ')"
else
    echo "  ❌ NixOS modules directory missing"
fi

if [ -d "modules/home" ]; then
    echo "  ✅ Home modules directory exists"
    echo "  📄 Home modules: $(ls modules/home/ | tr '\n' ' ')"
else
    echo "  ❌ Home modules directory missing"
fi

echo
echo "🔨 Testing dry builds..."
echo

# Test nixos system builds
for host in nixos nixos-laptop nixos-server; do
    if [ -d "hosts/$host" ]; then
        echo "Testing system build for $host..."
        if nix build --dry-run ".#nixosConfigurations.$host.config.system.build.toplevel" 2>/dev/null; then
            echo "  ✅ $host system build OK"
        else
            echo "  ❌ $host system build FAILED"
        fi
    fi
done

echo

# Test home-manager builds
for config in "nixos@nixos" "matt@nixos-laptop" "matt@nixos-server"; do
    echo "Testing home-manager build for $config..."
    if nix build --dry-run ".#homeConfigurations.\"$config\".activationPackage" 2>/dev/null; then
        echo "  ✅ $config home build OK"
    else
        echo "  ❌ $config home build FAILED"
    fi
done

echo
echo "=== Verification Complete ==="
echo
echo "💡 To rebuild systems:"
echo "  System: sudo nixos-rebuild switch --flake ~/nix#<hostname>"
echo "  Home: home-manager switch --flake ~/nix#<user>@<hostname>"

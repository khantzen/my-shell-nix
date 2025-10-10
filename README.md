# My Shell Nix

Repository where I store my shell.nix file

NixOS: https://nixos.org/

Nixpkgs : https://search.nixos.org/packages

## How to

Setup your system with following alias

```shell
alias download_shell_nix="f() { curl https://raw.githubusercontent.com/khantzen/my-shell-nix/refs/heads/main/shell.$1.nix -o shell.nix }; f"
```

Then run

```shell
download_shell_nix python
```

It will download `shell.python.nix` from this repository under the name `shell.nix`




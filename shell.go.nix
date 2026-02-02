let

pkgs = import <nixpkgs> {};

shell = pkgs.mkShell {
  name = "My go project";

  buildInputs = [
    pkgs.go

    pkgs.cowsay
    pkgs.fortune
  ];

  shellHook = ''
    fortune | cowsay
  '';

};

in

shell

let

pkgs = import <nixpkgs> {};

pythonEnv = pkgs.python312;

pythonPackages = pythonEnv.withPackages (pythonPkgs: with pythonPkgs; [
  black
  pytest
]);

shell = pkgs.mkShell {
  name = "My python project";

  buildInputs = [
    pythonPackages

    pkgs.cowsay
    pkgs.fortune
  ];

  shellHook = ''
    fortune | cowsay
  '';

};

in

shell

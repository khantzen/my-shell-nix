let
pkgs = import <nixpkgs> {};

pythonEnv = pkgs.python312;

workTools = with pkgs; [
  cowsay
  fortune
];

shell = pkgs.mkShell {
  name = "Simple data parsing";

  nativeBuildInputs = [ 
    pkgs.yq
    pkgs.jq
    workTools 
  ];

  shellHook = ''
    fortune | cowsay
  '';
};

in
shell

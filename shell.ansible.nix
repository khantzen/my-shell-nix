let
pkgs = import <nixpkgs> {};

pythonEnv = pkgs.python312;

pythonPackages = pythonWorkingEnv.withPackages (pythonPkgs: with pythonPkgs; [
  ansible-core
]);

workTools = with pkgs; [
  cowsay
  fortune
];

shell = pkgs.mkShell {
  name = "Ansible Project"

  nativeBuildInputs = [ 
    pythonPackages 
    workTools 
  ];

  shellHook = ''
    fortune | cowsay
  '';
};

in
shell

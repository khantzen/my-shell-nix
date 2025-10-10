let

pkgs = import <nixpkgs> {};

cloud_tooling = with pkgs; [
   opentofu awscli2
];

shell = pkgs.mkShell {
  name = "Opentofu aws";

  buildInputs = [
    cloud_tooling

    pkgs.cowsay
    pkgs.fortune
  ];

  shellHook = ''
    fortune | cowsay
  '';

};

in

shell

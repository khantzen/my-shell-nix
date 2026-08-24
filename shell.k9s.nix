let

pkgs = import <nixpkgs> {};

kube_tool = with pkgs; [
  kubernetes-helm
  kubectl
  k9s
];

shell = pkgs.mkShell {
  name = "My Kubernetes Project";

  buildInputs = [ kube_tool pkgs.curl pkgs.cowsay pkgs.fortune];

  shellHook = ''
    source <(kubectl completion bash)

    echo "-- Download kube aliases"

    curl -o ".kube_aliases" https://gist.githubusercontent.com/kha20240826/ce6c1be56af8ebfdd417febd3d216f2f/raw/a3254e3d0da9fb550462cd81d1bcb3710f5979cd/.bash_aliases

    current_path=$(pwd)

    source .kube_aliases

    touch .user_aliases
    source .user_aliases

    alias print_kube_aliases="cat $current_path/.kube_aliases && cat $current_path/.user_aliases"
    alias k9s_cheatsheet="firefox https://k9scli.io/topics/commands/"
    
    export KUBECONFIG=$(find ~/.kube/ -maxdepth 1 -type f -printf "%p:" | sed 's/:$//')

    echo "-- Environment initialized, check aliases using \`print_kube_aliases\`"
    echo "-- Write your aliases in \`./.user_aliases\` file and source them \`source .user_aliases\` or reload nix-shell"
  '';
};

in

shell

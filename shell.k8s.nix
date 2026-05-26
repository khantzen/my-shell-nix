let

pkgs = import <nixpkgs> {};

kube_tool = with pkgs; [
  kubernetes-helm
  kubectl
];

shell = pkgs.mkShell {
  name = "My Kubernetes Project";

  buildInputs = [ kube_tool pkgs.cowsay pkgs.fortune];

  shellHook = ''
    source <(kubectl completion bash)

    alias k="kubectl"
    
    alias kns_list="kubectl get namespaces"
    alias kx_list="kubectl config get-contexts"
  
    alias kx='f() { [ "$1" ] && kubectl config use-context $1 || kubectl config current-context ; } ; f'
    alias kns='f() { [ "$1" ] && kubectl config set-context --current --namespace $1 || kubectl config view --minify | grep namespace | cut -d" " -f6 ; } ; f'

    fortune | cowsay

  '';
};

in

shell

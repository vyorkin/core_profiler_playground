with import <nixpkgs> { };

let
  ocamlVersion = (builtins.parseDrvName pkgs.ocamlPackages.ocaml.name).version;
  packages = (with pkgs.ocamlPackages; [
    ocaml
    base
    stdio
    core
    core_bench
    core_profiler
    findlib
    utop
    merlin
    ocp-indent
    ocp-index
    ounit
  ]);
  mkpath = p: "${p}/lib/ocaml/${ocamlVersion}/site-lib";
  paths = builtins.concatStringsSep ":" (map mkpath packages);
in pkgs.mkShell {
  buildInputs = with pkgs; [ dune ncurses ] ++ packages;

  shellHook = ''
    export CAML_LD_LIBRARY_PATH="$CAML_LD_LIBRARY_PATH:${paths}"
  '';
}

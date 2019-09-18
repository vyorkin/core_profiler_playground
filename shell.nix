with import <nixpkgs> { };

let
  ocamlVersion = (builtins.parseDrvName pkgs.ocamlPackages.ocaml.name).version;
  packages = (with pkgs.ocamlPackages; [
    ocaml
    findlib
    utop
    merlin
    ocp-indent
    ocp-index

    base
    stdio

    core
    core_bench
    core_profiler

    ppx_bench
    ppx_inline_test

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

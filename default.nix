{ pkgs ? (import <nixpkgs> {}), coq-version ? "master" }:

let
 coq =
   if coq-version == "8.8" then pkgs.coq_8_8
   else import (fetchTarball "https://github.com/coq/coq/tarball/${coq-version}") {};

 mathcomp =
   if coq-version == "8.8" then pkgs.coqPackages_8_8.mathcomp
   else import ./mathcomp.nix { inherit pkgs coq; };
in

pkgs.stdenv.mkDerivation rec {

  name = "lemma-overloading";

  buildInputs = [ coq mathcomp ];

  src = ./.;

  makeFlags =
    if coq-version == "8.8" then ""
    else "COQPATH=${mathcomp}/lib/coq/user-contrib/";

  installFlags = "COQLIB=$(out)/lib/coq/";

  shellHook =
    if coq-version == "8.8" then ""
    else "export COQPATH=${mathcomp}/lib/coq/user-contrib/$\{COQPATH:+:$COQPATH}";
}

{ pkgs ? (import <nixpkgs> {}), coq }:

pkgs.stdenv.mkDerivation rec {
  name = "mathcomp";
  buildInputs = [ coq pkgs.which ];
  src = "${fetchTarball https://github.com/math-comp/math-comp/tarball/master}/mathcomp";
  installPhase = ''
    make -f Makefile.coq COQLIB=$out/lib/coq/ install
  '';
}

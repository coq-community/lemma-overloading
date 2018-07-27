{ pkgs ? (import <nixpkgs> {}), coq }:

pkgs.stdenv.mkDerivation rec {
  name = "ssreflect";
  buildInputs = [ coq pkgs.which ];
  src = "${fetchTarball https://github.com/math-comp/math-comp/tarball/master}/mathcomp";
  configurePhase = "make Makefile.coq";
  buildPhase = "make -f Makefile.coq ssreflect/all_ssreflect.vo";
  installPhase = "make -f Makefile.coq COQLIB=$out/lib/coq/ install";
}

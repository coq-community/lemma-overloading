{ pkgs ? (import <nixpkgs> {}), coq-version ? "master" }:

let
  coqPackages =
    if coq-version == "8.8" then pkgs.coqPackages_8_8 else
    if coq-version == "8.9" then pkgs.coqPackages_8_9 else
    pkgs.mkCoqPackages
      (import (fetchTarball "https://github.com/coq/coq/tarball/${coq-version}") {
        buildIde = false;
        buildDoc = false;
        doInstallCheck = false;
        coq-version = "8.9";
      })
    ;
in

pkgs.stdenv.mkDerivation rec {

  name = "lemma-overloading";

  buildInputs = with coqPackages; [ coq ssreflect ];

  src = ./.;

  installFlags = "COQLIB=$(out)/lib/coq/";
}

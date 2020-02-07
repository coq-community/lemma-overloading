# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]
### Added
- Support for building with dune

## [8.11.0] - 2020-02-01
### Removed
- Support for Coq 8.9 and below

### Fixed
- Ignore more untracked files: `.vos` and `.vok`
- `undeclared-scope` warnings (this requires Coq 8.10 or later)
- `duplicate-clear` warnings

### Changed
- Add `coqdocjs`-based source code documentation

## [8.10.0] - 2019-12-08
### Fixed
- Coq 8.10 and MathComp 1.10 compatibility
- `auto-template` warning is not relevant anymore

### Removed
- Nix support in CI for Coq 8.11 because of broken build
- Remove some local aliases for MathComp lemmas: `eqn_addl`, `modn_addl`, `modn_mulr`, `modn_add2m`, `modn_addr`

### Changed
- Update documentation

## [8.9.0] - 2019-05-16
### Fixed
- Support for Coq 8.9, MathComp 1.7.0 and 1.8.0
- Remove all `admit`s.
- `set-maximal-deprecated` warnings
- `implicit-core-hint-db` warnings
- `_CoqProject` file's compatibility with Proof General, CoqIDE, `coq_makefile` utility

### Changed
- Switch to opam2
- Modernize build scripts to use `coq_makefile` features
- Minimized and refactored imports
- Reorganize code into subdirectories
- Use `-Q` in `CoqProject` instead of `-R`
- Update documentation

[Unreleased]: https://github.com/coq-community/lemma-overloading/compare/v8.11.0...master
[8.11.0]: https://github.com/coq-community/lemma-overloading/releases/tag/v8.11.0
[8.10.0]: https://github.com/coq-community/lemma-overloading/releases/tag/v8.10.0
[8.9.0]: https://github.com/coq-community/lemma-overloading/releases/tag/v8.9.0

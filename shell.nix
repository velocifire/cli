with (import <nixpkgs> {});

mkShell {
  buildInputs = [
    rustc
    cargo
    rustfmt
    rust-analyzer
    clippy
  ];
  shellHook = ''
  '';

  RUST_BACKTRACE = 1;
  RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
}

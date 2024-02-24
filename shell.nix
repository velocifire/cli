with (import <nixpkgs> {});

mkShell {
  buildInputs = [
    rustc
    cargo
  ];
  shellHook = ''
  '';
}

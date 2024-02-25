with (import <nixpkgs> {});

mkShell {
  buildInputs = [
    rustc
    cargo
    rustfmt
    rust-analyzer
    clippy
    clang
    llvmPackages.bintools
    pkg-config
    iconv
    pkgs.darwin.apple_sdk.frameworks.CoreFoundation
    pkgs.darwin.apple_sdk.frameworks.CoreServices
    pkgs.darwin.apple_sdk.frameworks.SystemConfiguration
  ];
  shellHook = ''
  '';

  RUST_BACKTRACE = 1;
  RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
  LIBCLANG_PATH = pkgs.lib.makeLibraryPath [ pkgs.llvmPackages_latest.libclang.lib ];
    # Add precompiled library to rustc search path
    RUSTFLAGS = (builtins.map (a: ''-L ${a}/lib'') [
      # add libraries here (e.g. pkgs.libvmi)
    ]);
    # Add glibc, clang, glib and other headers to bindgen search path
    BINDGEN_EXTRA_CLANG_ARGS = 
    # Includes with normal include path
    (builtins.map (a: ''-I"${a}/include"'') [
      # add dev libraries here (e.g. pkgs.libvmi.dev)
#      pkgs.glibc.dev 
    ])
    # Includes with special directory paths
    ++ [
      ''-I"${pkgs.llvmPackages_latest.libclang.lib}/lib/clang/${pkgs.llvmPackages_latest.libclang.version}/include"''
      ''-I"${pkgs.glib.dev}/include/glib-2.0"''
      ''-I${pkgs.glib.out}/lib/glib-2.0/include/''
    ];

}

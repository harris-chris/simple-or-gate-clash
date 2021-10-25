{ pkgs ? import <nixpkgs> {}, clash-pkgs ? import ./clash-compiler/nix/nixpkgs.nix {} }:

let
  unstable = import (fetchTarball https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz) {};
  vitis-fhs = "./nix/vitis-fhs-env.nix";
  vivado-fhs = "./nix/vivado-fhs-env.nix";
  xilinx-fhs = "./nix/xilinx-fhs-env.nix";

  vitis-repl-script = pkgs.writeShellScriptBin "vitis-repl" ''
    #!/bin/bash
    nix-shell --pure --argstr run "vitis_hls -i" "${xilinx-fhs}"
  '';

  vivado-run-command = "vivado -log ./logfiles/vivado/vivado.log -journal ./logfiles/vivado/vivado.jou";
  vivado-gui-script = pkgs.writeShellScriptBin "vivado-gui" ''
    #!/bin/bash
    nix-shell --argstr run "${vivado-run-command}" "${xilinx-fhs}"
  '';

  makefile-contents = builtins.readFile ./nix/Makefile;
  makefile-run-command = "make -f ./nix/Makefile -I ./ $*";
  make-script = pkgs.writeShellScriptBin "make" ''
    function run {
      nix-shell --pure --argstr run "${makefile-run-command}" "${xilinx-fhs}"
    }

    if [[ $# -eq 0 ]]; then
      run
    else
      run "$@"
    fi
  '';

  run-script = pkgs.writeShellScriptBin "xilinx-shell" ''
    #!/bin/bash
    nix-shell --pure --argstr run "bash" "${xilinx-fhs}"
  '';

  shell-scripts = [ vitis-repl-script vivado-gui-script make-script run-script ];

  #clash-packages = with clash-pkgs.pkgs.haskellPackages; [ clash-ghc clash-lib clash-prelude clash-cores ];
  #clash-dependencies = with clash-pkgs.pkgs.haskellPackages; [ ];
  #clash-all = clash-packages ++ clash-dependencies;

in pkgs.mkShell {
  packages = with pkgs; [ ] ++ shell-scripts;

  buildInputs = with unstable.haskellPackages; with clash-pkgs.pkgs.haskellPackages; [
    (ghcWithPackages (p: with p; [
      clash-ghc
  
      ghc-typelits-extra
      ghc-typelits-knownnat
      ghc-typelits-natnormalise
    ])
    )
  ];
}

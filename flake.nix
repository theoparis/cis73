{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      pkgs = import nixpkgs {
        system = "aarch64-linux";
      };
      python = pkgs.python312;
      pythonPackages = python.pkgs;
    in
    {
      devShells.aarch64-linux.default = pkgs.mkShell {
        name = "cis73-pi";
        nativeBuildInputs = [ pkgs.bashInteractive ];
        buildInputs = [
          (python.withPackages (ps: with ps; [
            jedi-language-server
            yapf
            notebook
            traitlets
            matplotlib
            scipy
            rpi-gpio
            setuptools
            wheel
          ]))
        ];
        # venvDir = ".venv";
        src = null;
        # postVenv = ''
          # unset SOURCE_DATE_EPOCH
        # '';
        postShellHook = ''
          unset SOURCE_DATE_EPOCH
          unset LD_PRELOAD

          PYTHONPATH=$PWD/$venvDir/${python.sitePackages}:$PYTHONPATH
        '';
      };
    };
}

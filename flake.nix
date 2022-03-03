{
  description = "howtoman";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.11";
  };
  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    inherit (nixpkgs) lib;
    systems = lib.systems.supported.hydra;
    pkgsFor = system: import nixpkgs {inherit system;};
    forSystems = f: lib.genAttrs systems (system: f (pkgsFor system));
  in {
    defaultPackage = forSystems (pkgs:
      pkgs.stdenv.mkDerivation {
        pname = "howtoman";
        src = lib.cleanSource self;
        version = self.lastModifiedDate or "0";
        dontBuild = true;
        installFlags = "PREFIX=${placeholder "out"}";
      });
    defaultApp = forSystems (pkgs: let
      app = pkgs.writeShellScript "howtoman" ''
        export MANPATH=${self.defaultPackage.${pkgs.system}}/share/man
        exec ${pkgs.man-db}/bin/man howtoman
      '';
    in {
      type = "app";
      program = "${app}";
    });
  };
}

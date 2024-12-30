{
  perSystem = { pkgs, ... }: {
    devShells = {
      dotnet = pkgs.mkShell {
        packages = with pkgs; [ dotnet-sdk_8 nuget-to-nix ];
      };
    };
  };
}


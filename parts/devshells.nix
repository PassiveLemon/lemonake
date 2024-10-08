{
  perSystem = { pkgs, ... }: {
    devshells = {
      dotnet = {
        name = "dotnet";
        packages = with pkgs; [ dotnet-sdk_8 nuget-to-nix ];
      };
    };
  };
}


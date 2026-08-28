{pkgs, ...}:

{
  services.syncthing = {
    enable = true;
    settings = {
      devices = {
        titan = {
          id  = "FMHIL4I-RAS3OIZ-ND7ECNB-I5KKJ2S-DC6CE2U-ZLUJGAO-57VU24F-SGCD7A5";
        };
        discovery = {
          id = "HTW73T5-AT5SBMQ-A44VFGQ-BJU4XZH-NAA6VMU-6FVIXEN-RTZWKZV-GKSY7A6";
        };
      };
      folders = {
        books = {
          path = "~/Books";
          devices = [ "titan" "discovery" ];
        };
      };
    };
  };
}


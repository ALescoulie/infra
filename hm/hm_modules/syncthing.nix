{pkgs, ...}:

{
  services.syncthing = {
    enable = true;
    
    devices = {
      macbook = {
        id  = "FMHIL4I-RAS3OIZ-ND7ECNB-I5KKJ2S-DC6CE2U-ZLUJGAO-57VU24F-SGCD7A5";
      };
    };
  };
}


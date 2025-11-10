self: super:
let
  pkgs = super;
in
{
  vmware-workstation = super.vmware-workstation.overrideAttrs (old: {
    version = "25H2"; 
    src = pkgs.fetchurl {
      url = "https://support.broadcom.com/group/ecx/productdownloads?subfamily=VMware%20Workstation%20Pro&freeDownloads=true";
      # Replace sha256 with the value from nix-prefetch-url (see commands below)
      sha256 = "08ik14acywlxb10v733carg67xablml734d9k8p3ijak0s5fvv4v"; 
    };
    patches = (old.patches or []) ++ ( /* add additional patches here if needed */ []);
    nativeBuildInputs = (old.nativeBuildInputs or []) ++ [ pkgs.which ];
  });
}

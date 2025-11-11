self: super:
let
  pkgs = super;
in
{
  vmware-workstation = super.vmware-workstation.overrideAttrs (old: {
    version = "25H2"; 
    src = pkgs.fetchurl {
      url = "file:///home/aadithyan/.dotfiles/additionalFiles/VMware-Workstation-Full-25H2-24995812.x86_64.bundle";
      # Replace sha256 with the value from nix-prefetch-url (see commands below)
      sha256 = "ceW7c8QUr952qxO24qvs/fvYq/hMPjuwJUHX6hvO/8U="; 
    };
    patches = (old.patches or []) ++ ( /* add additional patches here if needed */ []);
    nativeBuildInputs = (old.nativeBuildInputs or []) ++ [ pkgs.which ];
  });
}

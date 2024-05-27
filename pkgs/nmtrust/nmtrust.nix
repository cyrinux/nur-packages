{ stdenv, fetchFromGitHub, ... }:

stdenv.mkDerivation rec {
  pname = "nmtrust";
  version = "1.0.0"; # Update this to match the actual version if needed

  src = fetchFromGitHub {
    owner = "pigmonkey";
    repo = pname;
    rev = "master";
    sha256 = "sha256-dzaKId/kNgjBFwXKqSm6G8IlBibCzTeGLSVnu3YwSvc="; # Update with actual hash
  };

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/bin
    cp ${src}/nmtrust $out/bin/
    cp ${src}/ttoggle $out/bin/
    mkdir -p $out/etc/NetworkManager/dispatcher.d
    cp ${src}/dispatcher/10trust $out/etc/NetworkManager/dispatcher.d/
    chmod +x $out/bin/nmtrust
    chmod +x $out/bin/ttoggle
    chmod +x $out/etc/NetworkManager/dispatcher.d/10trust
  '';

  # meta = with lib; {
  #   description = "A simple framework for determining network trust with NetworkManager.";
  #   homepage = "https://github.com/pigmonkey/nmtrust";
  #   license = licenses.mit; # Confirm if the license is MIT
  #   maintainers = with maintainers; [ cyrinux ];
  # };
}

{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, wrapGAppsHook4
, gtk4
, libadwaita
, wayland
, wayland-protocols
, gtk4-layer-shell
}:

rustPlatform.buildRustPackage rec {
  pname = "cursor-clip";
  version = "unstable-2026-03-25";

  src = fetchFromGitHub {
    owner = "Sirulex";
    repo = "cursor-clip";
    rev = "4cbfaf56e6ca06c39f08b1f72394702aae3fbf35";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };

  cargoHash = "sha256-BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB=";

  nativeBuildInputs = [
    pkg-config
    wrapGAppsHook4
  ];

  buildInputs = [
    gtk4
    libadwaita
    wayland
    wayland-protocols
    gtk4-layer-shell
  ];

  meta = with lib; {
    description = "GTK4 Clipboard Manager with dynamic positioning. Features a Windows 11–style clipboard history, adapted to native GNOME design.";
    homepage = "https://github.com/Sirulex/cursor-clip";
    license = licenses.gpl3Only;
    platforms = platforms.linux;
    mainProgram = "cursor-clip";
  };
}
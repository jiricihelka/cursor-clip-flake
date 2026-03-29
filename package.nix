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
, dbus
, glib
}:

rustPlatform.buildRustPackage rec {
  pname = "cursor-clip";
  version = "unstable-2026-03-25";

  src = fetchFromGitHub {
    owner = "Sirulex";
    repo = "cursor-clip";
    rev = "4cbfaf56e6ca06c39f08b1f72394702aae3fbf35";
    hash = "sha256-pcaflvMzcxva1Lshw7PWifV8r/SwI/0O9iBYBdZkTjs=";
  };

  cargoHash = "sha256-icWHtJY63FRt+N4+0HrJWMWMOXTGq0Hu3ug1+7JvUmc=";

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
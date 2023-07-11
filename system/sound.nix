{ ... }: {
  # Enables sound
  sound.enable = true;
  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };

  hardware.pulseaudio.enable = false;
  # hardware.pulseaudio = {
  #   enable = true;
  #   extraModules = [ pkgs.pulseaudio-modules-bt ];
  #   package = pkgs.pulseaudioFull;
  # };

  hardware.bluetooth.settings = {
    General = {
      Enable = "Source,Sink,Media,Socket";
    };
  };

  users.users.necdet.extraGroups = [ "audio" ];
}

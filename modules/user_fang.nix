{ config, lib, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.fang = {
    isNormalUser = true;
    description = "Fang";
    shell = pkgs.fish;
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "video"
      "input"
      "kvm"
    ];
    packages = with pkgs; [
    (texlive.withPackages (ps: [
      ps.collection-latexextra
      ps.collection-fontsrecommended
      ps.collection-langchinese
    ]))
    # denaro
    # natron
    # quarto
    # elmerfem
    # kicad
    # librepcb
    # paraview
    # jmol
    # meshlab
    # godot
    # sage
    # goldendict-ng
    # exhibit
    # gradia
    # thunderbird
    # digital
    # logisim-evolution
    # qucs-s
    # simulide
    # squirrel-sql
    # sonic-visualiser
    # getdp
    # neothesia
    # gImageReader
    gimp
    boxxy
    codex
    epiphany
    eartag
    newsflash
    gnome-podcasts
    keepassxc
    upscayl
    librecad
    doit
    rnote
    friture
    converseen
    freecad
    stellarium
    freac
    spek
    clipgrab
    onlyoffice-desktopeditors
    trilium-next-desktop
    sayonara
    blender
    golden-cheetah
    gearlever
    font-manager
    ignition
    mangojuice
    pwvucontrol
    keypunch
    morphosis
    peazip
    foliate
    devtoolbox
    planify
    qbittorrent
    apostrophe
    jamesdsp
    ghostty
    superfile
    podman-desktop
    distroshelf
    distrobox
    (prismlauncher.override { jdks = [ pkgs.temurin-jre-bin-24 ]; })
    (pkgs.mpv.override {
      extraMakeWrapperArgs = [
        "--add-flags" "--vo=gpu-next"
        "--add-flags" "--gpu-api=vulkan"
        "--add-flags" "--gpu-context=waylandvk"
        "--add-flags" "--hwdec=auto"
        "--add-flags" "--cache=yes"
        "--add-flags" "--demuxer-max-bytes=2GiB"
        "--add-flags" "--demuxer-max-back-bytes=1GiB"
        "--add-flags" "--cache-secs=180"
        "--add-flags" "--cache-pause=yes"
        "--add-flags" "--demuxer-thread=yes"
      ];
      extraUmpvWrapperArgs = [
        "--add-flags" "--vo=gpu-next"
        "--add-flags" "--gpu-api=vulkan"
        "--add-flags" "--gpu-context=waylandvk"
        "--add-flags" "--hwdec=auto"
        "--add-flags" "--cache=yes"
        "--add-flags" "--demuxer-max-bytes=2GiB"
        "--add-flags" "--demuxer-max-back-bytes=1GiB"
        "--add-flags" "--cache-secs=180"
        "--add-flags" "--cache-pause=yes"
        "--add-flags" "--demuxer-thread=yes"
      ];
      youtubeSupport = true;
      scripts = with pkgs.mpvScripts; [ mpris thumbfast uosc ];
    })
    ];
  };
}


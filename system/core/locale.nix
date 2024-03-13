{ pkgs, ... }: {
  time.timeZone = "Europe/Istanbul";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = { LC_ALL = "en_US.UTF-8"; };
    supportedLocales = [ "en_US.UTF-8/UTF-8" "tr_TR.UTF-8/UTF-8" ];
  };

  console = {
    font = "${pkgs.terminus_font}/share/consolefonts/ter-120n.psf.gz";
    keyMap = "trq";
  };
}

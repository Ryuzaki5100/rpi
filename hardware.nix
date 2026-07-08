{ ... }:

{
  networking.networkmanager.ensureProfiles.profiles = {

    Home = {
      connection = {
        id = "Home";
        type = "wifi";
      };

      wifi = {
        ssid = "Ryuzaki";
      };

      wifi-security = {
        key-mgmt = "wpa-psk";
        psk = "atharvaditya";
      };

      ipv4.method = "auto";
      ipv6.method = "auto";
    };

  };
}

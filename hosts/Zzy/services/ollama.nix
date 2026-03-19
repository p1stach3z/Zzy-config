
{ config, lib, pkgs, ... }:
{
#  services.ollama-rocm = {
#    enable = true;
 #   package = with pkgs; [ ollama-rocm ];
    # host = "127.0.0.1";
    # port = 11434;
#  };

  # Opcional: límites para que no se coma la laptop.
  # systemd.services.ollama.serviceConfig = {
  #   MemoryMax = "12G";
  #   CPUQuota = "300%";
  # };
}

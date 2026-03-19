{ pkgs, lib, config, ... }:

{

services.xserver.enable = false;
services.displayManager.gdm.enable = false;
services.displayManager.sddm.enable = false;
services.greetd.enable = false;

}

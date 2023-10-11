# modules
Custom NixOS Modules

## Installation

First, add this repository as a channel for the root user.

```console
[root@nixos:~]# nix-channel --add https://github.com/j0hax/modules/archive/main.tar.gz modules
```

Then, update channels.

```console
[root@nixos:~]# nix-channel --update
this derivation will be built:
  /nix/store/3n0ym16rnijgsdg0m7xarxlc062y266p-modules.drv
building '/nix/store/3n0ym16rnijgsdg0m7xarxlc062y266p-modules.drv'...
unpacking channels...
```

## Using Modules

Simply add the file to the imports, such as `<modules/file.nix>`

```nix
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      <modules/server.nix>
    ];
...
```

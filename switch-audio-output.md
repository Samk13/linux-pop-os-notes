
# Automate audio output switching between speakers and headphones

Add the path to this bash script to a custom keyboard shortcut to switch audio output between speakers and headphones.
to do that, create a bash script with the following content:

```bash
#!/bin/bash


CURRENT_SINK=$(pactl get-default-sink)

if [ "$CURRENT_SINK" = "bluez_output.C0_86_B3_50_E6_0E.1" ]; then
    pactl set-default-sink alsa_output.pci-0000_07_00.1.hdmi-stereo
else
    pactl set-default-sink bluez_output.C0_86_B3_50_E6_0E.1
```
then in Pop!_OS, go to settings -> keyboard shortcuts -> custom shortcuts -> add custom shortcut
and set the command to the path of the bash script in command field


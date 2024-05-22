# Audio swapping input

create this bash script:
```bash
#!/bin/bash


CURRENT_SINK=$(pactl get-default-sink)

if [ "$CURRENT_SINK" = "bluez_output.C0_86_B3_50_E6_0E.1" ]; then
    pactl set-default-sink alsa_output.pci-0000_07_00.1.hdmi-stereo
else
    pactl set-default-sink bluez_output.C0_86_B3_50_E6_0E.1
```

save it as `swap-audio.sh` and make it executable with `chmod +x swap-audio.sh`

than assign a shortcut to it in your desktop environment settings
in Pop!_OS it's in `Settings > Keyboard Shortcuts > Custom Shortcuts`
in command put the path to the script and assign a shortcut to it


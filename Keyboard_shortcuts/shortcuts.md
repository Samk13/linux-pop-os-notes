# Audio swapping input

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


# Updated script on Ubuntu 24:

```bash
#!/bin/bash

# Get the current default sink
CURRENT_SINK=$(pactl get-default-sink)

# Define the sink names
SINK_HDMI="alsa_output.pci-0000_07_00.1.5.hdmi-stereo" # HDMI Output
SINK_BLUETOOTH="bluez_output.C0_86_B3_50_E6_0E.1"      # Bluetooth Output (Shokz)

# Toggle between the sinks
if [ "$CURRENT_SINK" = "$SINK_BLUETOOTH" ]; then
    pactl set-default-sink "$SINK_HDMI"
    echo "Switched to HDMI Output"
elif [ "$CURRENT_SINK" = "$SINK_HDMI" ]; then
    pactl set-default-sink "$SINK_BLUETOOTH"
    echo "Switched to Bluetooth Output"
else
    echo "Current sink ($CURRENT_SINK) is not recognized. No action taken."
fi

```

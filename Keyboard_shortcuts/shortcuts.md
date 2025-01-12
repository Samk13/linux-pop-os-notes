# Toggles Audio Output using a shortcut

Add the path to this bash script to a custom keyboard shortcut to switch audio output between speakers and headphones.
to do that, create a bash script with the following content:


```bash
#!/bin/bash

: '
toggle_audio_output.sh

This script dynamically toggles between available audio output devices (sinks) on a Linux system using PulseAudio (pactl command). 
It identifies the current default sink, retrieves a list of all available sinks, and switches the default to the next sink in the list. 
If the end of the list is reached, it wraps around to the first sink.

Features:
- Dynamic detection of audio sinks (no hardcoding of sink names required).
- Seamless toggling through all available sinks.
- Compatibility with systems using PulseAudio (via pactl).

Usage:
1. Save the script as toggle_audio_dynamic.sh.
2. Make it executable:
   chmod +x toggle_audio_dynamic.sh
3. Run the script:
   ./toggle_audio_dynamic.sh

Example:
- If the current default sink is "alsa_output.pci-0000_07_00.1.5.hdmi-stereo", the script switches to the next available sink, e.g., "bluez_output.C0_86_B3_50_E6_0E.1".
- If the current default sink is the last in the list, the script wraps around and sets the first sink as the default.
Note that this is been tested with 2 devices only not more

Dependencies:
- PulseAudio must be installed and running.
- pactl command must be available.

Error Handling:
- If the current sink is not found in the list of available sinks, the script exits with an error message.
'


# Get the current default sink
CURRENT_SINK=$(pactl get-default-sink)

# Get a list of all available sinks
AVAILABLE_SINKS=($(pactl list short sinks | awk '{print $2}'))

# Check if there are any sinks available
if [ ${#AVAILABLE_SINKS[@]} -eq 0 ]; then
    echo "Error: No audio sinks are available."
    exit 1
fi

# Check if there is only one sink
if [ ${#AVAILABLE_SINKS[@]} -eq 1 ]; then
    echo "Only one audio sink available: ${AVAILABLE_SINKS[0]}"
    echo "No toggling is necessary."
    exit 0
fi

# Find the index of the current sink in the list
CURRENT_INDEX=-1
for i in "${!AVAILABLE_SINKS[@]}"; do
    if [ "${AVAILABLE_SINKS[$i]}" = "$CURRENT_SINK" ]; then
        CURRENT_INDEX=$i
        break
    fi
done

# Check if the current sink was found
if [ $CURRENT_INDEX -eq -1 ]; then
    echo "Error: Current sink ($CURRENT_SINK) not found in the list of available sinks."
    exit 1
fi

# Calculate the index of the next sink in the list (wrap around if necessary)
NEXT_INDEX=$(( (CURRENT_INDEX + 1) % ${#AVAILABLE_SINKS[@]} ))

# Get the name of the next sink
NEXT_SINK=${AVAILABLE_SINKS[$NEXT_INDEX]}

# Set the next sink as the default
pactl set-default-sink "$NEXT_SINK"
echo "Switched to sink: $NEXT_SINK"

```

then in Pop!_OS, go to settings -> keyboard shortcuts -> custom shortcuts -> add custom shortcut e.g: ctr + super + f12
Ubuntu24: settings -> keyboard shortcuts -> view and Customize Shortcuts -> Custom Shortcuts -> +
Set the command to the path of the bash script in the command field


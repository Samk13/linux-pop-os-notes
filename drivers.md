#

- Follow the  instructions [here](https://github.com/PixlOne/logiops?tab=readme-ov-file#building)

here is the settings where the thumbheel act as volume up and down

> make sure to put the right name for the device in order to work properlly

in `/etc/logid.cfg`
paste this code:

```bash
devices: (
{
    name: "MX Master 3S";
    smartshift:
    {here
        on: true;
        threshold: 30;
    };
    hiresscroll:
    {
        hires: true;
        invert: false;
        target: false;
    };


    thumbwheel:
    {
        divert: true;
        invert: false;

        left: {
                mode: "OnInterval";
                interval: 2;
                action: {
                        type: "Keypress";
                        keys: ["KEY_VOLUMEDOWN"];
                };
        };
        right: {
                mode: "OnInterval";
                interval: 2;
                action: {
                        type: "Keypress";
                        keys: ["KEY_VOLUMEUP"];
                };
        };

        tap: {
            type: "Keypress";
            keys: ["KEY_MUTE"];
        };

    };
    dpi: 1000;

    buttons: (
        {
            cid: 0xc3;
            action =
            {
                type: "Gestures";
                gestures: (
                    {
                        direction: "Up";
                        mode: "OnRelease";
                        action =
                        {
                            type: "Keypress";
                            keys: ["KEY_LEFTCTRL", "KEY_F10"];
                        };
                    },
                    {
                        direction: "Down";
                        mode: "OnRelease";
                        action =
                        {
                            type: "Keypress";
                            keys: ["KEY_LEFTCTRL", "KEY_F7"];
                        };
                    },
#                    {
#                        direction: "Left";
#                        mode: "OnRelease";
#                        action =
#                        {
#                            type: "CycleDPI";
#                            dpis: [50, 500, 1000, 1500, 2000, 3000, 4000];
#                        };
#                    },
                    {
                        direction: "Left";
                        mode: "OnRelease";
                        action =
                        {
                            type: "Keypress";
                            keys: ["KEY_LEFTMETA", "KEY_LEFT"];
                        };
                    },

#                    {
#                        direction: "Right";
#                        mode: "OnRelease";
#                        action =
#                        {
#                            type = "ToggleHiresScroll";
#                        }
#                    },
                    {
                        direction: "Right";
                        mode: "OnRelease";
                        action =
                        {
                            type: "Keypress";
                            keys: ["KEY_LEFTMETA", "KEY_RIGHT"];
                        }
                    },

                    {
                        direction: "None"
                        mode: "NoPress"
                    }
                );
            };
        },
        {
            cid: 0xc4;
            action =
            {
                type = "ToggleSmartshift";
            };
        },
        {
            # Next tab instead of fwd in history, Comment to default behavior
            cid: 0x53;
            action =
            {
                type :  "Keypress";
                keys: ["KEY_LEFTCTRL", "KEY_PAGEUP"];
            };
        },
        {
            # Previous tab instead of back in history, Comment to default behavior
            cid: 0x56;
            action =
            {
                type :  "Keypress";
                keys: ["KEY_LEFTCTRL", "KEY_PAGEDOWN"];
            };
        }
    );
}
);

```

Check the [link for more info](https://wiki.archlinux.org/title/Logitech_MX_Master)

## Nvidia Drivers

When I login a found one of the screen is zoomed in, and the vertical screen is off.
Solution:

Step 1: Purge Existing NVIDIA Packages
First, ensure that all NVIDIA packages are purged:

```bash
sudo apt-get purge nvidia-*
sudo apt-get autoremove
sudo apt-get autoclean
```

Step 2: Clean Up Residual Configurations

```bash
sudo rm -rf /var/lib/dpkg/lock-frontend /var/lib/dpkg/lock
sudo dpkg --configure -a
sudo apt-get install -f
```

Step 3: Reboot Your System

```bash
sudo reboot
```

Step 4: Install a Stable NVIDIA Driver
Let's install the nvidia-driver-470 and the necessary utilities:

```bash
sudo apt update
# sudo apt install nvidia-driver-470 nvidia-utils-470

# see official site: https://support.system76.com/articles/install-pop/
sudo apt install system76-driver-nvidia
```

Step 5: Reboot Your System

```bash
sudo reboot
```

Step 6: Verify the Installation
After rebooting, check if the NVIDIA driver is correctly installed and the nvidia-smi command is available:

```bash
nvidia-smi
```

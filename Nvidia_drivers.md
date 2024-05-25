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
sudo apt install nvidia-driver-470 nvidia-utils-470
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
 # Toubleshooting commands
 
## System logs
  
view system log messages with a priority level of "error" that have been logged since the last boot

```bash
journalctl -p err -b
```

provides information about the NVIDIA GPU

```bash
nvidia-smi
```

## General System Information

```bash
uname -a
```

Show all system information.

```bash
lsb_release -a
```

Display distribution-specific information.

```bash
hostnamectl
```

View or change the system hostname and related settings.

System Logs

```bash
journalctl -p err -b
```

Show error logs since the last boot.

```bash
dmesg
```

Print kernel ring buffer messages.

```bash
tail -f /var/log/syslog
```

Continuously monitor system log messages.

Disk and Filesystem

```bash
df -h
```

Show disk usage in human-readable format.


```bash
du -sh *
```

Display the size of a directory and its contents.


```bash
lsblk
```

List information about all available block devices.


```bash
fdisk -l
```

List all partitions on all disks.

Memory and CPU

```bash
top
```

Display real-time system information, including CPU and memory usage.


```bash
htop
```

Interactive process viewer.


```bash
free -h
```

Display free and used memory in human-readable format.

Network

```bash
ifconfig
```

Display network interface information (deprecated, use ip).


```bash
ip addr
```

Show IP addresses and network interfaces.


```bash
ping <hostname/IP>
```

Check connectivity to a specific host.


```bash
traceroute <hostname/IP>
```

Trace the route packets take to a network host.


```bash
netstat -tuln
```

Show listening ports and active connections.


```bash
ss -tuln
```

Display listening sockets and their details.

Package Management

```bash
apt update
```

Update package index (Debian/Ubuntu).


```bash
apt upgrade
```

Upgrade all upgradable packages (Debian/Ubuntu).


Process Management

```bash
ps aux
```

Show detailed information about running processes.


```bash
kill -9 <PID>
```

Forcefully terminate a process by its PID.


```bash
systemctl status <service>
```

Check the status of a service.


```bash
systemctl restart <service>
```

Restart a service.

File and Directory Operations

```bash
ls -l
```

List files and directories with detailed information.


```bash
cp <source> <destination>
```

Copy files or directories.


```bash
mv <source> <destination>
```

Move or rename files or directories.


```bash
rm -rf <directory>
```

Recursively remove a directory and its contents.

User and Permissions

```bash
chmod 755 <file>
```

Change file permissions.


```bash
chown <user>:<group> <file>
```

Change file owner and group.


```bash
usermod -aG <group> <user>
```

Add a user to a group.

Disk Usage and Management

```bash
fsck /dev/<disk>
```

Check and repair a filesystem.


```bash
mount /dev/<disk> /mnt
```

Mount a filesystem.


```bash
umount /mnt
```

Unmount a filesystem.

Miscellaneous

```bash
grep <pattern> <file>
```

Search for a pattern in a file.


```bash
find /path -name <filename>
```

Find files by name.


```bash
tar -czvf archive.tar.gz /path/to/directory
```

Create a compressed tarball.


```bash
tar -xzvf archive.tar.gz
```

Extract a compressed tarball.

Networking

```bash
ip link show
```

Show network interfaces and their state.


```bash
ethtool <interface>
```

Display or change Ethernet device settings.


```bash
iwconfig
```

Show wireless network interface details.


```bash
nmap <hostname/IP>
```

Network exploration tool and security/port scanner.

System Information

```bash
lscpu
```

Display CPU architecture information.


```bash
lsmem
```

Display memory information.


```bash
lsusb
```

List USB devices.


```bash
lspci
```

List PCI devices.

System Performance

```bash
iostat
```

Report CPU and I/O statistics.


```bash
vmstat
```

Report virtual memory statistics.


```bash
sar
```

Collect, report, or save system activity information.

Security

```bash
ufw status
```

Check the status of the uncomplicated firewall.


```bash
firewall-cmd --state
```

Check the status of the firewalld service.


```bash
iptables -L
```

List iptables firewall rules.


```bash
fail2ban-client status
```

Check the status of Fail2Ban.

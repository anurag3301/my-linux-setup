# This is for Arch Base Installation with DWM and ST
### **OPTIONAL:** connect to wifi
```sh
# Start iwctl
iwctl

# List the devices, it will contain device and adapter id
device list

# Power on
device {wlan0} set-property Powered on
adapter {phy0} set-property Powered on

# Scan and list access points
station {wlan0} scan
station {wlan0} get-networks
station {wlan0} connect {SSID}
```
#### **Lets start with checking internet connection**
```sh
ping 8.8.8.8
```
**Now set the time and date**
```sh
timedatectl set-ntp true
timedatectl status
```
**Lets make partations**
```sh
# list the partations
fdisk -l

# now open the disk in fdisk, in my case 
fdisk /dev/nvme0n1  #sda

# now make 3 partations
# First of 512 MB as EFI partations
# Second of 2GB as linux swap
# And remaing as Linux Filesystem
```
Demo output of partationing
> To be done

**Lets format partations**
```sh
# format efi disk as fat32
mkfs.fat -F32 /dev/{efi-partation}

# format swap partation
mkswap /dev/{swap-partation}

# make use of swapt partation
swapon /dev/{swap-partation}

# format linux filesystem partation as ext4
mkfs.ext4 /dev/{linux-filesystem-partation}
```

**Make use of the partations by mounting them**
```sh
# Mount the Linux Filesystem partation of drive to /mnt dir of boot environment
mount /dev/{linux-filesystem-partation} /mnt

# Make a boot directory in the linux filesystem partation mount the efi partation in the boot dir.
mkdir /mnt/boot
mount /dev/{efi-partation} /mnt/boot

# confirm the partation and mounting
df
```

**Base Linux firmware installaion with vim**
```sh
pacstrap /mnt base linux linux-firmware vim base-devel linux-headers 
genfstab -U /mnt >> /mnt/etc/fstab

# chcek the fstab
cat /mnt/etc/fstab
```

**Now lets change root to the installed arch**
```sh
arch-chroot /mnt
```

**Set the locale and timezone**
```sh
ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
hwclock --systohc
vim /etc/locale.gen    # uncomment en_US.UTF-8 UTF-8
locale-gen             # Generate the locale file
vim /etc/locale.conf   # add "LANG=en_US.UTF-8"
```
**Set hostname and hosts**
```sh
echo arch > /etc/hostname
vim /etc/hosts
# and add following
"
127.0.0.1       localhost
::1             localhost
127.0.0.1       arch.localdomain        arch
"
```
**Change the password**
```sh
passwd
```
**Install systemd-boot (UEFI only) and other stuff**
```sh
pacman -Sy networkmanager sudo git efibootmgr
# Add amd-ucode or intel-ucode too if you want CPU microcode updates

# Install systemd-boot into the EFI partation (mounted at /boot)
bootctl install

# Loader config
cat > /boot/loader/loader.conf << EOF
default arch.conf
timeout 3
console-mode max
editor no
EOF

# Find the UUID of the linux filesystem partation
blkid -s UUID -o value /dev/{linux-filesystem-partation}

# Boot entry for Arch, paste the UUID from above
cat > /boot/loader/entries/arch.conf << EOF
title   Arch Linux
linux   /vmlinuz-linux
initrd  /initramfs-linux.img
options root=UUID={uuid} rw
EOF

# Check the entries are valid
bootctl list
```
> **Dual boot:** systemd-boot lists Windows automatically only if Windows uses the *same* EFI partation.
> If Windows has its own EFI partation (like on my PC), just pick it from the firmware boot menu, or copy
> `EFI/Microsoft` from the Windows EFI partation into `/boot/EFI`.
>
> Systemd-boot works only on UEFI. For old BIOS/MBR machines use [this guide](./Base_Install_BIOS-MBR.md) (GRUB).
## Reboot
```sh
# exit from arch-chroot
exit

# Unmount eveything
umount -a

# now reboot
reboot
```

**Now add a new user and add to sudo group**
```sh
# Add a new user and create home dir for him
useradd -m anurag

# change password for the new user
passwd anurag

# Add the new user to some group includeing sudo
usermod -aG wheel,audio,video,storage anurag

# Now make the sudo execute command with root previleges
visudo # uncomment "%wheel ALL=(ALL) ALL" and "%sudo   ALL=(ALL) ALL"
```

## Secure Boot with sbctl (optional, do it after first boot into the installed system)
Works with systemd-boot and keeps Windows/Debian dual boot working (Microsoft keys are enrolled too).
```sh
sudo pacman -S sbctl
sudo sbctl status        # Setup Mode will be Disabled for now

# 1. Create your own keys (stored in /var/lib/sbctl)
sudo sbctl create-keys

# 2. Sign the kernel and bootloader, -s saves them in the sbctl database
#    so the pacman hook re-signs them after every update
sudo sbctl sign -s /boot/vmlinuz-linux
sudo sbctl sign -s /boot/EFI/systemd/systemd-bootx64.efi
sudo sbctl sign -s /boot/EFI/BOOT/BOOTX64.EFI

# Make "bootctl update" install the signed bootloader instead of the stock one
sudo sbctl sign -s -o /usr/lib/systemd/boot/efi/systemd-bootx64.efi.signed /usr/lib/systemd/boot/efi/systemd-bootx64.efi
sudo bootctl update

# Everything should say signed
sudo sbctl verify
```
Signed binaries still boot fine with Secure Boot off, so this is safe to do first.

**3. Put the firmware in Setup Mode**
```sh
systemctl reboot --firmware-setup
```
In the BIOS (mine is AMI): Security -> Secure Boot -> set OS type to **Custom**, then
clear/delete the Platform Key (or "Reset to Setup Mode"). Leave Secure Boot itself off for now and boot Arch.
```sh
sudo sbctl status        # Setup Mode: Enabled
```

**4. Enroll the keys**
```sh
# -m also enrolls Microsoft's keys, needed for Windows and GPU option ROMs, don't skip it on a dual boot
sudo sbctl enroll-keys -m
```

**5. Reboot to BIOS, turn Secure Boot ON, then verify**
```sh
sudo sbctl status        # Secure Boot: Enabled, Setup Mode: Disabled
bootctl status           # Secure Boot: enabled (user)
```

**Notes**
- If something fails to boot, disable Secure Boot in the BIOS to get back in, everything is still bootable.
- Kernel updates are signed automatically by the sbctl pacman hook. After a systemd update run `sudo bootctl update`.
- Out-of-tree DKMS modules (VirtualBox etc.) still load, the kernel only logs a tainted/signature warning.
- Only the kernel and bootloader are verified, the initramfs is not. For full coverage look at Unified Kernel Images (UKI).

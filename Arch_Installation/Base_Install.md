# This is for Arch Base Installation with DWM and ST
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
fdisk /dev/nvme0n1

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

**Base Linux firmware installaion**
```sh
pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab

# chcek the fstab
vim /mnt/etc/fstab
```

**Now lets change root to the installed arch**
```sh
arch-chroot /mnt
```

**Set the locale and timezone**
```sh
# Install vim first
pacman -Sy vim

# Now do the locae stuff
ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
hwclock --systohc
vim /etc/locale.gen    # uncomment en_US.UTF-8 UTF-8
vim /etc/locale.conf   # append LANG=en_US.UTF-8
```
**Set hostname and hosts**
```sh
echo arch > /etc/hostname
vim /etc/hosts
# and add following
"
127.0.0.1	localhost
::1		localhost
127.0.0.1	arch.localdomain	arch
"

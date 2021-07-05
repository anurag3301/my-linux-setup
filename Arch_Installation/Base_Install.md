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

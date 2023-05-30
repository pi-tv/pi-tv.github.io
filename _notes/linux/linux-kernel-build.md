---
title: Linux kernel build 
tags: [Kernel, Linux, Syslinux]
commands: [make]
date: 2021-12-27
---

# Linux kernel build

## Pre-conditions

- Downloaded and validated "linux-5.15.11.tar.xz"
- Build and target system is Arch Linux in Virtualbox on AMD Ryzen5 4600H host

## Build

```shell
pacman -Sy base-devel
pacman -Sy xmlto kmod inetutils bc libelf git cpio perl
pacman -Sy ccache

make /kernelbuild
tar -xvf linux-5.15.11.tar.xz --directory /kernelbuild/
cd /kernelbuild/linux-5.15.11
make mrproper
zcat /proc/config.gz > .config
make menuconfig
# ---------------------
# select config options
# see ## Config options
# ---------------------

#make -j5
export CCACHE_DIR="/kernelbuild/linux-5.15.11/.ccache"
time make CC="ccache gcc" -j5
#real    68m22.013s
#user    305m52.551s
#sys     29m12.620s

#make modules
time make modules CC="ccache gcc" -j5

sudo make modules_install
make bzImage
sudo cp -v arch/x86/boot/bzImage /boot/vmlinuz-linux-x
sudo mkinitcpio -k 5.15.11-x -g /boot/initramfs-linux-x.img
```

## Boot loader

- In case of syslinux, edit "/boot/syslinux/syslinux.cfg", like this:

```text
DEFAULT linux
PROMPT 1
TIMEOUT 5

LABEL linux
    LINUX ../vmlinuz-linux
    APPEND root=/dev/sda1 rw vga=773
    INITRD ../initramfs-linux.img

LABEL linux-x
    LINUX ../vmlinuz-linux-x
    APPEND root=/dev/sda1 rw vga=773
    INITRD ../initramfs-linux-x.img
```

then run `syslinux-install_update -iam`

## Config options

### General setup

- CONFIG_LOCALVERSION=-x
- CONFIG_IKCONFIG=N
- CONFIG_IKHEADERS=N

### Processor type and features

- CONFIG_CPU_SUP_AMD=Y
- CONFIG_GART_IOMMU=N
- CONFIG_NR_CPUS=32
- CONFIG_X86_MCE_INTEL=N
- CONFIG_X86_MCE_INJECT=N
- CONFIG_I8K=N
- CONFIG_MICROCODE=N
- CONFIG_CRASH_DUMP=N

### Binary Emulations

- CONFIG_IA32_EMULATION=N

### Executable file formats

- CONFIG_COREDUMP=N

### CONFIG_HAMRADIO

### Library routines

- CONFIG_FONT_TER16x32=N

### Networking support

- CONFIG_HAMRADIO
- CONFIG_CAN=N
- CONFIG_BT=N
- CONFIG_RFKILL=N
- CONFIG_NET_9P=N
- CONFIG_CAIF=N
- CONFIG_NFC=N
- WIRELESS=ALL N

### Device Drivers

- CONFIG_PCCARD=N
- CONFIG_PARPORT=N
- CONFIG_MACINTOSH_DRIVERS=N
- CONFIG_MEDIA_SUPPORT=N
- CONFIG_RC_CORE=N
- CONFIG_SOUND=N

### File systems

- CONFIG_JFS_FS=N
- CONFIG_XFS_FS=N
- CONFIG_GFS2_FS=N
- CONFIG_OCFS2_FS=N
- CONFIG_BTRFS_FS=N
- CONFIG_NILFS2_FS=N
- CONFIG_F2FS_FS=N
- CONFIG_ORANGEFS_FS=N
- CONFIG_AFFS_FS=N
- CONFIG_HFS_FS=N
- CONFIG_HFSPLUS_FS=N
- CONFIG_BEFS_FS=N
- CONFIG_JFFS2_FS=N
- CONFIG_UBIFS_FS=N
- CONFIG_CRAMFS=N
- CONFIG_MINIX_FS=N
- CONFIG_OMFS_FS=N
- CONFIG_ROMFS_FS=N
- CONFIG_SYSV_FS=N
- CONFIG_UFS_FS=N
- CONFIG_EROFS_FS=N
- CONFIG_NETWORK_FILESYSTEMS=N
- CONFIG_NLS=select some

### Security options

- CONFIG_SECURITY_SELINUX=N
- CONFIG_SECURITY_SMACK=N
- CONFIG_SECURITY_TOMOYO=N
- CONFIG_SECURITY_APPARMOR=N
- CONFIG_SECURITY_YAMA=N

### Kernel hacking

- CONFIG_DEBUG_BUGVERBOSE=N
- CONFIG_DEBUG_INFO=N
- CONFIG_DEBUG_MISC=N
- RUNTIME_TESTING_MENU=N

## Links

- [Linux kernel](/linux-kernel)
- [Kernel/Arch Build System](https://wiki.archlinux.org/title/Kernel/Arch_Build_System)
- [Kernel/Traditional compilation](https://wiki.archlinux.org/title/Kernel/Traditional_compilation)
- [Kernel/Gentoo Kernel Configuration Guide](https://wiki.gentoo.org/wiki/Kernel/Gentoo_Kernel_Configuration_Guide)
- [kernelconfig](https://www.kernelconfig.io/index.html)

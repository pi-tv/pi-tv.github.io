---
title: VirtualBox
tags: [VirtualBox, VM]
date: 2021-02-23
---

# VirtualBox

## Start, stop, status

- Show VM info: `vboxmanage showvminfo myArch`
- Headless start: `vboxmanage startvm myArch --type headless`
- Stop VM:  `vboxmanage controlvm myArch acpipowerbutton`

## Devices

- Show list of host USB devices: `vboxmanage list usbhost`
- Enable USB3 mode: `vboxmanage modifyvm myArch --usbxhci on`
- Attach USB device: `vboxmanage controlvm myArch usbattach MyUUID`
- Detach USB device: `vboxmanage controlvm myArch usbdetach MyUUID`
- Reset disk UUID: `vboxmanage internalcommands sethduuid myArch.vdi`

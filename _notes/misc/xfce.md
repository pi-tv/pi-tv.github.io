---
title: Xfce
tags: [GUI, Linux, Xfce]
date: 2021-03-01
---

# Xfce

## Install

```bash
pacman -Sy xorg-server xfce4
startxfce4
```

## Configure

Add this into the ".bash_profile" file to autostart Xfce when login on tty6:

```shell
if [ "$(tty)" = "/dev/tty6" ] ; then
  startxfce4
fi
```

## Cleanup

- Remove some unwanted menu-items (".desktop" files) from "/usr/share/applications"
- Set `Categories=X-Xfce-Toplevel` for some menu-items (by editing the ".desktop" files)

## Start menu

This reduced main menu created according to
[menu specification](https://specifications.freedesktop.org/menu-spec/menu-spec-1.0.html)
`Application menu -> Use custom menu file`

```xml
<!DOCTYPE Menu PUBLIC "-//freedesktop//DTD Menu 1.0//EN"
        "http://www.freedesktop.org/standards/menu-spec/1.0/menu.dtd">
<Menu>
    <Name>Xfce</Name>

    <DefaultAppDirs/>
    <DefaultDirectoryDirs/>

    <Include>
        <All/>
    </Include>

    <Layout>
        <Filename>xfce4-run.desktop</Filename>
        <Menuname>Settings</Menuname>
        <Filename>xfce4-terminal.desktop</Filename>
        <Separator/>
        <Filename>firefox.desktop</Filename>
        <Separator/>
        <Filename>mousepad.desktop</Filename>
        <Filename>pycharm.desktop</Filename>
        <Separator/>
        <Filename>xfce4-session-logout.desktop</Filename>
    </Layout>

    <Menu>
        <Name>Settings</Name>
        <Include>
            <Category>Settings</Category>
        </Include>

        <Layout>
            <Filename>xfce-settings-manager.desktop</Filename>
            <Separator/>
            <Merge type="all"/>
        </Layout>
    </Menu>

</Menu>
```
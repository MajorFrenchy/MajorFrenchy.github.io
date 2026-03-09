---
layout: post
title: "VPinFE MacOS"
date: 2026-03-05
categories: [Front-end, Pinball, Mac]
image: /Screenshots/VpinFE/VPinFE.jpg
---

This is a cross-platform front end for Virtual Pinball. This guide covers setup on macOS.

[![Watch the video](https://img.youtube.com/vi/YD4eZIqHypw/hqdefault.jpg)](https://www.youtube.com/watch?v=YD4eZIqHypw)
## youtube-video-tutorial <br>

<br>
<br>
A frontend for vpinball with the following features:
<br>
- Works on Linux, Windows, and Mac (Windows must use Standalone dir structure)<br>
- Multiscreen - Supports up to 3 screens (Backglass, DMD, and Table)<br>
- Keyboard & Joystick support<br>
- Table and Media Manager (Auto download art via VPinMediaDB)<br>
- Build custom table collections (VPS ID-based and filter-based)<br>
- Automatic vpx patching for Linux & Mac<br>
- Fully customizable UI theming using HTML, JS and CSS<br>
- JSON-based table metadata with VPX file parsing and feature detection<br>
- Mobile transfer support for VPinball on Android and iOS (Web Send & VPXZ Download)<br>

## Table of Contents

1. [YouTube Video Tutorial](#youtube-video-tutorial)
2. [Install VPinFE](#install-vpinfe)
3. [First Launch Permissions](#first-launch-permissions)
4. [Open the Settings Screen](#open-the-settings-screen)
5. [Initial Setup](#initial-setup)
6. [Adding Tables](#adding-tables)
7. [Remote](#remote)




## Install VPinFE
{: #install-vpinfe }

1. Download the latest build from [VPinFE Runs](https://github.com/superhac/vpinfe/actions) (GitHub login required).
2. Drag the app icon into your `Applications` folder.

<img src="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/VpinFE/VPinFE-download.jpg" width="75%" alt="VPinFE download page" />

<img src="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/VpinFE/VPinFE-app.jpg" width="75%" alt="VPinFE app install" />

## First Launch Permissions
{: #first-launch-permissions }

On first launch, macOS security prompts may appear.

1. Open `System Settings > Privacy & Security` and allow VPinFE.
2. Open `System Settings > Privacy & Security > Files and Folders` and allow file access.

<img src="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/VpinFE/VPinFE-privacy.jpg" width="75%" alt="VPinFE privacy permission" />

<img src="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/VpinFE/VPinFE-privacy2.jpg" width="75%" alt="VPinFE files and folders permission" />

## Open the Settings Screen
{: #open-the-settings-screen }

- Local device: `127.0.0.1:8001`
- Another device on your network: `YOUR_VPINFE_IP:8001` (example: `192.168.1.113:8001`)

<img src="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/VpinFE/VPinFE-url.jpg" width="75%" alt="VPinFE URL and settings access" />

## Initial Setup
{: #initial-setup }

1. Configure monitor mappings in the Settings menu.
2. Set the VPX Standalone paths:
   - `vpxbinpath = /Applications/VPinballX_BGFX.app/Contents/MacOS/VPinballX_BGFX`
   - `tablerootdir = /Users/YOURUSERNAME/Desktop/vpinball/`
   - `vpxinipath = /Users/YOURUSERNAME/Library/Application Support/VPinballX/10.8/VPinballX.ini`
3. Pick and activate your theme.

<img src="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/VpinFE/VPinFE-monitors.jpg" width="75%" alt="VPinFE monitor settings" />

<img src="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/VpinFE/VPinFE-settings.jpg" width="75%" alt="VPinFE path settings" />

<img src="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/VpinFE/VPinFE-theme.jpg" width="75%" alt="VPinFE theme selection" />

<img src="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/VpinFE/VPinFE%20cab.jpg" width="75%" alt="VPinFE cabinet theme" />

<img src="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/VpinFE/VPinFE-Tables.jpg" width="75%" alt="VPinFE tables view" />

<img src="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/VpinFE/VPinFE-vpx.jpg" width="75%" alt="VPinFE VPX launch options" />

# Adding Tables
{: #adding-tables }

To run correctly, your VPX files should follow a standalone folder structure.

<img src="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/VpinFE/VPinFE-folderstructure.jpg" width="75%" alt="VPX folder structure" />

Add your tables folder under:

`tablerootdir = /Users/YOURUSERNAME/Desktop/vpinball/`

In Manager UI, use the **Tables > Unmatched** button to add tables to your library.

<img src="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/VpinFE/VPinFE-unmatched.jpg" width="75%" alt="Unmatched tables" />

Your table must be associated with a VirtualPinballSpreadsheet table ID so VPinFE can download matching media.

If you already have your own media, use **Use my own media**. Otherwise, trim extra characters in the table name until you get a VPS match, then click **Associate**.

<img src="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/VpinFE/VPinFE-mymedia.jpg" width="75%" alt="Use my own media" />

<img src="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/VpinFE/VpinFE-associate.jpg" width="75%" alt="Associate table in VPS" />

After association, VPinFE will:

- Add the table entry to your library
- Download media
- Create a `.info` file

# Remote
{: #remote }

Remote lets you control the front end from another computer, tablet, or phone.

Use:

`YOUR_VPINFE_IP:8001/remote` (example: `192.168.0.113:8001/remote`)

The Remote page includes 4 modes:

- `VPinFE`: restart VPinFE, reboot, or shut down the computer
- `PinMAME`: change ROM menu settings (for example, ROM volume)
- `VPX Game`: control VPX game settings and launch tables
- `VPX Maintenance`: volume and navigation controls

## Remote Gallery
{: #remote-gallery }

<table class="remote-gallery-table">
  <tr>
    <td align="center">
      <a href="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/VpinFE/VPinFE-vpinfectl.jpg" class="zoomable-photo">
        <img src="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/VpinFE/VPinFE-vpinfectl.jpg" width="300" alt="VPinFE remote control" />
      </a><br/>VPinFE Control
    </td>
    <td align="center">
      <a href="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/VpinFE/VPinFE-vpxrom.jpg" class="zoomable-photo">
        <img src="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/VpinFE/VPinFE-vpxrom.jpg" width="300" alt="PinMAME and VPX ROM controls" />
      </a><br/>PinMAME / VPX ROM
    </td>
  </tr>
  <tr>
    <td align="center">
      <a href="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/VpinFE/VPinFE-vpxmaintenance.jpg" class="zoomable-photo">
        <img src="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/VpinFE/VPinFE-vpxmaintenance.jpg" width="300" alt="VPX maintenance controls" />
      </a><br/>VPX Maintenance
    </td>
    <td align="center">
      <a href="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/VpinFE/VPinFE-Romcontrol.png" class="zoomable-photo">
        <img src="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/VpinFE/VPinFE-Romcontrol.png" width="300" alt="ROM control screen" />
      </a><br/>ROM Control
    </td>
  </tr>
</table>

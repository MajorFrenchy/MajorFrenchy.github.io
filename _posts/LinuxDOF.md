---
layout: post
title: "VPinFE MacOS"
date: 2026-03-23
categories: [Front-end, Pinball, Mac]
published: false
---
HardwareDescriptionDocumentation / SourcePinscape@mjrgh's popular pinball controller with 32+ outputsGitHubPinscape PicoRP2040-based version with enhanced featuresGitHubTeensyStripControllerTeensy based WS2812 LED strip controllerGitHubWemosD1MPStripControllerWemos D1 Mini Pro based WS2812 LED strip controllerGitHubPacLED64Ultimarc's 64-output LED controller with PWM supportUltimarcLedWizLED-Wiz's 32-port USB compatible lighting and output controllerGroovyGameGearPinOneCleveland Software Design controller with 63 outputsProduct DocsFTDI ControllersFT245R bitbang controllersWiki🧪 Implemented & Ready To TestHardwareDescriptionDocumentation / SourceDudesCabRP2040-based controller with 128 PWM outputsGitHubUMXControllerUnified MX protocol for addressable stripsGitHubArtNet/DMXProfessional Ethernet-based lighting controlArtNetPinControlArduino-based controllers for 10+ outputsWebsite
<img src="https://github.com/MajorFrenchy/MajorFrenchy.github.io/blob/main/Screenshots/Linux-DOF/DOF-supported.jpg" 
     width="100%"
     alt="Screenshot"><br>



     

This is the page if your have a current Windows working DOF config for your cabinet. If you are starting from scratch and do not have a config for your Force feeback and addressable LED, then click HERE .  <br>

I am going to try keeping this guide as practical and easy to understand as possible. I am not going to go deep in the concepts. <br>
<br>

If you already have DOF working on Windows, we will make it work on Linux much faster. Here are the things to consider on Linux for DOF

<br>
- All force feedback should work on Linux depending on the type of controller you are using. 
- SSF ( Surround Sound Feedback ) is currently NOT WORKING. 
- Addressable LED are working. ( Some effect might be innacurate ) 
- Pup Packs are working 50/50 ( A lot of them will require re-coding )
<br>
<br>

What do you need to get DOF working on Ubuntu <br>
- VPX 10.8.1_BGFX <vbr>
- DOF Config files <br>
- Your hardware configured <br>
- Udev rule for each device <br>
- Add dialout group for Modem access/Serial ports access

I create a tool that will help you test your devices under Linux ( Pinball Toolset ) This tool has some limited device config capability, it is designed to test the ports. 
I strongly suggest you use the native Windows app for your device ( in Windows or Linux using Wine ). The tool will also flash firmware on the Teensy and Wemos. The tool is also designed to create a cabinet file and create a B2SServer.xml file  
<br>
<br>

STEP 1 <br>
Download VPX 10.8.1_BGFX ( This version has a DOF plugin built in ) 

<br>

STEP 2 <br>

Install and setup VPX ( Look at this Article and Video if you need help ) <br>

STEP 3 <br>
Turn on the DOF plugin in VPX  ( F12 LiveUI menu / Plugins / DOF ) Save Globally <br>

STEP 4 <br>
Copy your Online DOF config to the following folder.  ( .local/share/VpinballX/10.8.0/directoutputconfig ) You also copy GlobalConfig_B2Sserver.xml and cabi ent.xml ibn this folder.<br>

STEP 5 <br>
edit your GlobalConfig_B2Sserver.xml change the paths as follow.<br>

STEP 6 <br>
You need to add a Udev rule for each of your USB controller ( Pinscape Pico, PinOne, Arnoz, Teensy , ) udev permissions control who can access hardware devices (USB boards, serial ports, HID controllers, etc.) when Linux detects them. Without correct udev rules, apps like VPX may not be allowed to read/write your controller unless run as root, which causes missing inputs or unstable behavior. With proper rules, your normal user gets consistent access to the right devices at boot/replug time, improving reliability and security (no need to run everything with elevated privileges). <br>
<br> 

<a href="https://github.com/MajorFrenchy/MajorFrenchy.github.io/blob/main/_posts/guides/Linux-UDEV-Quick-Tutorial.md">UDEV complete guide</a>

<img src="https://github.com/MajorFrenchy/MajorFrenchy.github.io/blob/main/Screenshots/Linux-DOF/udev-rule.jpg" 
     width="100%"
     alt="Screenshot">
-----
Plug the device in.
Open Terminal.
Find the device IDs:
lsusb
Look for your device and note ID xxxx:yyyy (vendor:product).

Create a rule file:
---

```bash
sudo nano /etc/udev/rules.d/99-vpinball.rules 
```

---
<br>

Add this line (replace IDs):
```bash
SUBSYSTEM=="usb", ATTR{idVendor}=="xxxx", ATTR{idProduct}=="yyyy", MODE="0666"
```
---
<br>
Save and exit (Ctrl+O, Enter, Ctrl+X).

Reload rules:
---
```bash
sudo udevadm control --reload-rules
sudo udevadm trigger
```
---

<br>
Unplug and replug the device (or reboot). <br>


# Pinscape And LED-Wiz Udev Rule Setup (Wemos Serial Usually Needs No Rule)

## Purpose

This adds Linux `udev` rules so Pinscape USB and LED-Wiz USB HID devices can be accessed by a normal user without running applications as `root`.

For typical Wemos/CH340 serial adapters on Linux, a custom `udev` rule is usually not required; group access (`dialout`) is normally sufficient.

The LED-Wiz device detected on this machine exposed a HID interface with:

- Vendor ID: `fafa`
- Product ID: `00f0`
- HID name: `GGG LED-Wiz`

The Pinscape device detected on this machine exposed a HID interface with:

- Vendor ID: `fafa`
- Product ID: `00f7`

The Wemos-style serial adapter detected on this machine exposed:

- Vendor ID: `1a86`
- Device node: `/dev/ttyUSB0`
- Stable serial path: `/dev/serial/by-id/usb-1a86_USB_Serial-if00-port0`

## Rule File

Recommended combined filename:

`/etc/udev/rules.d/99-pinball-devices.rules`

Combined rule contents:

```udev
# Pinball device access for non-root users
# Includes:
# - LED-Wiz HID device: vendor FAFA, product 00F0
# - Pinscape HID device: vendor FAFA, product 00F7

# LED-Wiz
KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="fafa", ATTRS{idProduct}=="00f0", MODE="0660", GROUP="plugdev", TAG+="uaccess"
SUBSYSTEM=="usb", ATTR{idVendor}=="fafa", ATTR{idProduct}=="00f0", MODE="0660", GROUP="plugdev", TAG+="uaccess"

# Pinscape Controller
KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="fafa", ATTRS{idProduct}=="00f7", MODE="0660", GROUP="plugdev", TAG+="uaccess"
SUBSYSTEM=="usb", ATTR{idVendor}=="fafa", ATTR{idProduct}=="00f7", MODE="0660", GROUP="plugdev", TAG+="uaccess"

# Wemos / CH340 serial adapter
# Usually not needed: serial access is typically handled by dialout group membership.
# Add a dedicated Wemos rule only if you need custom permissions or a stable symlink.
```

If you prefer separate files, you can still use:

Recommended LED-Wiz filename:

`/etc/udev/rules.d/99-ledwiz.rules`

LED-Wiz rule contents:

```udev
# LED-Wiz - HID access for non-root users
KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="fafa", ATTRS{idProduct}=="00f0", MODE="0660", GROUP="plugdev", TAG+="uaccess"
SUBSYSTEM=="usb", ATTR{idVendor}=="fafa", ATTR{idProduct}=="00f0", MODE="0660", GROUP="plugdev", TAG+="uaccess"
```

Recommended Pinscape filename:

`/etc/udev/rules.d/99-pinscape.rules`

Pinscape rule contents:

```udev
# Pinscape Controller - HID access for non-root users
KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="fafa", ATTRS{idProduct}=="00f7", MODE="0660", GROUP="plugdev", TAG+="uaccess"
SUBSYSTEM=="usb", ATTR{idVendor}=="fafa", ATTR{idProduct}=="00f7", MODE="0660", GROUP="plugdev", TAG+="uaccess"
```

Optional Wemos filename (usually not required):

`/etc/udev/rules.d/99-wemos.rules`

Optional Wemos rule contents:

```udev
# Wemos / CH340 USB serial access for non-root users
KERNEL=="ttyUSB*", SUBSYSTEM=="tty", ATTRS{idVendor}=="1a86", MODE="0660", GROUP="dialout", TAG+="uaccess"
SUBSYSTEM=="usb", ATTR{idVendor}=="1a86", MODE="0660", GROUP="dialout", TAG+="uaccess"
```

## Install Manually

1. Create the combined rule file:

```bash
sudo nano /etc/udev/rules.d/99-pinball-devices.rules
```

2. Paste the combined rule contents above.

If you prefer separate files instead:

3. Create the LED-Wiz rule file:

```bash
sudo nano /etc/udev/rules.d/99-ledwiz.rules
```

4. Paste the LED-Wiz rule contents above.

5. Create the Pinscape rule file:

```bash
sudo nano /etc/udev/rules.d/99-pinscape.rules
```

6. Paste the Pinscape rule contents above.

7. Optional: create the Wemos rule file only if you need custom serial behavior:

```bash
sudo nano /etc/udev/rules.d/99-wemos.rules
```

8. Paste the optional Wemos rule contents above.

9. Reload `udev` rules:

```bash
sudo udevadm control --reload-rules
sudo udevadm trigger --attr-match=idVendor=fafa --attr-match=idProduct=00f0
sudo udevadm trigger --attr-match=idVendor=fafa --attr-match=idProduct=00f7
# Optional (only if you created a Wemos rule)
sudo udevadm trigger --attr-match=idVendor=1a86
```

10. Unplug and reconnect the devices if needed.

11. If you had to add your user to `dialout`, restart the session before testing. A full reboot is the simplest fix:

```bash
sudo reboot
```

If you do not reboot or at least log out and back in, the current shell and desktop session can still miss the new `dialout` membership.

## Verify

Check the permissions on the device nodes:

```bash
ls -l /dev/hidraw* /dev/ttyUSB*
```

The Pinscape device should allow access through `plugdev` and/or the active desktop user via `uaccess`.

The LED-Wiz device should allow access through `plugdev` and/or the active desktop user via `uaccess`.

The Wemos serial device should normally allow access through `dialout`; `uaccess` applies if you chose to add an optional Wemos rule.

If the Wemos device still shows `root:dialout` and your user was only just added to `dialout`, reboot or log out and back in before troubleshooting further.

## Known Working Workflow

This is the workflow that now works on this machine for Pinscape with VPX and DirectOutput:

1. Keep the Pinscape `udev` rule in place for vendor `fafa` and product `00f7`.
2. Reload the rules if you changed them:

```bash
sudo udevadm control --reload-rules
sudo udevadm trigger --attr-match=idVendor=fafa --attr-match=idProduct=00f7
```

3. Unplug and reconnect the Pinscape controller.
4. Confirm the device is visible as a HID raw device:

```bash
ls -l /dev/hidraw*
```

5. Launch VPX normally as the regular desktop user.
6. Start a table that uses DirectOutput.
7. Check the table's `DirectOutput.log` if needed.

Working result seen in this setup:

- DirectOutput found `Pinscape Controller (unit 1)` on `/dev/hidraw1`
- Pinscape auto-configuration completed
- `Pinscape Controller 01` initialized successfully
- `LedWizEquivalent 51` resolved `73 of 73 outputs`

Example working log:

- [/home/mf/VPX/tables/Attack from Mars (Bally 1995)/DirectOutput.log](/home/mf/VPX/tables/Attack%20from%20Mars%20%28Bally%201995%29/DirectOutput.log)

If DirectOutput reports `Found Pinscape device` and later `initialized and updater thread started`, the workflow is working.

## Detection Notes

This session found a likely Pinscape HID device at:

- `/dev/hidraw2`

This session also found a LED-Wiz HID device at:

- initial detection: `/dev/hidraw1`
- after replug and active rule reload: `/dev/hidraw0`
- HID name: `GGG LED-Wiz`
- Vendor ID: `fafa`
- Product ID: `00f0`

Confirmed working permission result after applying the rule and replugging:

- `/dev/hidraw0` -> `root:plugdev`
- Mode: `crw-rw----`

This confirms the LED-Wiz `udev` rule is active and normal-user HID access is no longer blocked by device permissions.

The machine also has a separate USB serial adapter at:

- `/dev/ttyUSB0`
- USB serial ID path: `usb-1a86_USB_Serial-if00-port0`

That serial adapter is not the Pinscape HID rule target.

## DirectOutput Cabinet.xml

For DirectOutput, do not use the volatile `/dev/ttyUSB0` path if a stable by-id path exists.

Recommended `ComPortName` value:

```xml
<ComPortName>/dev/serial/by-id/usb-1a86_USB_Serial-if00-port0</ComPortName>
```

This is better than `/dev/ttyUSB0` because the `ttyUSB` number can change across boots or when USB devices are reconnected in a different order.

## Suggested Automation For Pinball Toolset

If you want to automate this in your app, the flow should be:

1. Detect USB devices with `udevadm info -a -n /dev/hidrawX`
2. Detect serial adapters with `udevadm info -a -n /dev/ttyUSBX`
3. Match Pinscape and (optionally) Wemos vendor/product IDs
4. Write `/etc/udev/rules.d/99-pinscape.rules`
5. Write `/etc/udev/rules.d/99-ledwiz.rules`
6. Optional: write `/etc/udev/rules.d/99-wemos.rules` only if needed
7. Run:

```bash
sudo udevadm control --reload-rules
sudo udevadm trigger --attr-match=idVendor=fafa --attr-match=idProduct=00f0
sudo udevadm trigger --attr-match=idVendor=fafa --attr-match=idProduct=00f7
# Optional (only if you created a Wemos rule)
sudo udevadm trigger --attr-match=idVendor=1a86
```

8. Confirm the user is in the correct groups:

```bash
id
```

Expected groups:

- LED-Wiz: `plugdev`
- Pinscape: `plugdev`
- Wemos serial: `dialout`

If `dialout` was added during setup, reboot before testing VPX or DirectOutput so the current login session picks up the new group membership.

## Files Created In This Session

- Rule template: [/home/mf/99-pinscape.rules](/home/mf/99-pinscape.rules)
- Rule template: [/home/mf/99-ledwiz.rules](/home/mf/99-ledwiz.rules)
- Rule template: [/home/mf/99-wemos.rules](/home/mf/99-wemos.rules)
- Combined template: [/home/mf/99-pinball-devices.rules](/home/mf/99-pinball-devices.rules)
- This guide: [/home/mf/Pinscape-UDEV-Setup.md](/home/mf/Pinscape-UDEV-Setup.md)

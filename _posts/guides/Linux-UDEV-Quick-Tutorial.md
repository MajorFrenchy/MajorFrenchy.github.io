## Linux Setup Tutorial (Pinscape + LED-Wiz, Wemos Optional)

- Use `udev` rules for `Pinscape` and `LED-Wiz` (HID devices).
- For `Wemos/CH340` serial, a custom `udev` rule is usually **not needed**.
- Make sure your user is in `dialout` for serial access.

```bash
sudo usermod -aG dialout "$USER"
```

- Find the actual USB devices first (this is how the IDs were obtained):

```bash
# 1) List USB devices (VendorID:ProductID)
lsusb

# 2) Find HID nodes (Pinscape / LED-Wiz usually show up as hidraw)
ls -l /dev/hidraw*

# 3) Inspect each HID node to get idVendor/idProduct
udevadm info -a -n /dev/hidraw0 | grep -E 'idVendor|idProduct|product|manufacturer'
udevadm info -a -n /dev/hidraw1 | grep -E 'idVendor|idProduct|product|manufacturer'

# 4) Find serial nodes (Wemos/CH340)
ls -l /dev/ttyUSB* /dev/ttyACM* /dev/serial/by-id/*

# 5) Inspect serial device to get vendor/product
udevadm info -a -n /dev/ttyUSB0 | grep -E 'idVendor|idProduct|serial|manufacturer'
```

- Use those values in your rules:
- Pinscape example: `idVendor=fafa`, `idProduct=00f7`
- LED-Wiz example: `idVendor=fafa`, `idProduct=00f0`
- Wemos/CH340 example: `idVendor=1a86`

- Create Pinscape rule:

```bash
sudo tee /etc/udev/rules.d/99-pinscape.rules >/dev/null <<'EOF2'
KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="fafa", ATTRS{idProduct}=="00f7", MODE="0660", GROUP="plugdev", TAG+="uaccess"
SUBSYSTEM=="usb", ATTR{idVendor}=="fafa", ATTR{idProduct}=="00f7", MODE="0660", GROUP="plugdev", TAG+="uaccess"
EOF2
```

- Create LED-Wiz rule:

```bash
sudo tee /etc/udev/rules.d/99-ledwiz.rules >/dev/null <<'EOF2'
KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="fafa", ATTRS{idProduct}=="00f0", MODE="0660", GROUP="plugdev", TAG+="uaccess"
SUBSYSTEM=="usb", ATTR{idVendor}=="fafa", ATTR{idProduct}=="00f0", MODE="0660", GROUP="plugdev", TAG+="uaccess"
EOF2
```

- Reload rules:

```bash
sudo udevadm control --reload-rules
sudo udevadm trigger --attr-match=idVendor=fafa --attr-match=idProduct=00f7
sudo udevadm trigger --attr-match=idVendor=fafa --attr-match=idProduct=00f0
```

- Log out/in (or reboot), then verify:

```bash
id
ls -l /dev/hidraw* /dev/ttyUSB* /dev/serial/by-id/*
```

- In `cabinet.xml`, prefer stable serial path:

```xml
<ComPortName>/dev/serial/by-id/usb-1a86_USB_Serial-if00-port0</ComPortName>
```

- Wemos/CH340 serial typically works with `dialout` access and does not need its own `udev` rule.

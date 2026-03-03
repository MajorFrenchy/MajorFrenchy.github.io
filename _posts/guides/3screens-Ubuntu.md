# Nvidia RTX Multi-Monitor Setup Guide

**Ubuntu 24.04 LTS | GeForce RTX 3070 (GA104) | Mixed HDMI/DisplayPort**

---

## 📋 Overview

This guide covers setting up **3 monitors** on Ubuntu 24.04 LTS with an Nvidia RTX GPU using a mix of HDMI and DisplayPort connections. 

The default Ubuntu installation uses the open-source **nouveau driver** which does not properly support all GPU outputs. The **proprietary Nvidia driver** is required to activate all ports.

---

## ✅ Requirements

- Ubuntu 24.04 LTS (desktop AMD64)
- Nvidia RTX GPU (tested on RTX 3070 / GA104)
- Mixed HDMI and DisplayPort cables
- Internet connection for driver download

---

## 🚀 Installation Steps

### Step 1: Install Ubuntu 24.04 with Safe Graphics Mode

The Ubuntu installer may show a distorted white box or fail to load on Nvidia systems. To avoid this, boot the installer using **Safe Graphics mode**:

1. **Boot from the Ubuntu 24.04 USB installer**
2. At the boot menu, select **"Try or Install Ubuntu (safe graphics)"** instead of the default option
3. Proceed through the installation normally
4. When asked about third-party software, **CHECK** the box for:
   > ☑️ **"Install third-party software for graphics and Wi-Fi hardware"**
   
   This installs the Nvidia driver automatically during setup
5. Complete the installation and reboot

---

### Step 2: Disable Wayland (Enable X11)

Ubuntu 24.04 defaults to **Wayland**, which has poor compatibility with Nvidia drivers for multi-monitor setups. Switch to **X11** before rebooting with the Nvidia driver.

**Open a terminal and run:**

```bash
sudo nano /etc/gdm3/custom.conf
```

**Find the line:**
```
#WaylandEnable=false
```

**Remove the `#` to uncomment it:**
```
WaylandEnable=false
```

**Save** with `Ctrl+O` and **exit** with `Ctrl+X`.

---

### Step 3: Verify the Nvidia Driver is Installed

Check if the Nvidia driver loaded correctly:

```bash
nvidia-smi
```

**Expected output:**
- A table showing your GPU model, driver version, and CUDA version

**If you see "No devices found"**, the driver is not loaded — proceed to Step 4.

**Also verify DKMS built the kernel module correctly:**

```bash
dkms status
```

**Expected output:**
```
nvidia/590.xx, 6.xx.x-xx-generic, x86_64: installed
```

---

### Step 4: Install Nvidia Driver Manually (if needed)

If `nvidia-smi` shows no devices, install the driver manually.

**First, ensure kernel headers and DKMS are present:**

```bash
sudo apt update
sudo apt install linux-headers-$(uname -r) dkms
```

**Then install the driver:**

```bash
sudo apt install nvidia-driver-590-open
```

> **Note:** Use the `-open` variant (open kernel module) which is recommended for RTX 30 series and newer. Replace `590` with whatever version is available/recommended on your system.

**To find the recommended driver version:**

```bash
ubuntu-drivers devices
```

**Or use the automatic installer:**

```bash
sudo ubuntu-drivers autoinstall
```

---

### Step 5: Switch to LightDM Display Manager

**GDM3** (the default display manager) can have compatibility issues with Nvidia drivers, resulting in a **black screen after boot** even when the driver is working. Switching to **LightDM** resolves this.

```bash
sudo apt install lightdm
sudo dpkg-reconfigure lightdm
```

When prompted, select **lightdm** as the default display manager.

**Then reboot:**

```bash
sudo reboot
```

---

### Step 6: Enable All 3 Monitors

After booting with LightDM and the Nvidia driver, check which displays are detected:

```bash
xrandr --query
```

**You should see all outputs listed** (e.g., `DP-0`, `DP-2`, `HDMI-0`).

If a monitor shows as disconnected, try **unplugging and replugging the cable** while the system is running — hot-plug detection often registers the monitor immediately.

**To force-enable a specific output:**

```bash
xrandr --output HDMI-0 --auto
```

**For a graphical interface** to arrange and configure monitors, use `nvidia-settings`:

```bash
nvidia-settings
```

Go to **X Server Display Configuration** to enable, arrange, and set resolutions for all 3 monitors.

---

## 🛠️ Troubleshooting

### Black screen after reboot

**Press `Ctrl+Alt+F2`** to access a text terminal (TTY). Log in and run:

```bash
nvidia-smi
```

If the driver is loaded, the issue is with the display manager — follow **Step 5** to switch to LightDM.

---

### Fatal: module nvidia not found

The kernel module wasn't built for your current kernel. Run:

```bash
sudo apt install linux-headers-$(uname -r)
sudo apt install --reinstall nvidia-driver-590-open
sudo reboot
```

---

### Only 1 or 2 monitors detected (3rd port inactive)

Some DisplayPort outputs on Nvidia GPUs are **only activated by the proprietary driver**. The nouveau driver will not enable all ports.

**Solutions:**
1. Ensure the proprietary driver is installed (Step 3/4)
2. Try moving the cable to a different DP port on the GPU
3. The RTX 3070 has multiple DP ports — not all are active simultaneously with nouveau

---

### Packages show iU (incomplete/failed install)

Run these commands to fix broken package states before attempting reinstall:

```bash
sudo apt install -f
sudo dpkg --configure -a
sudo reboot
```

---

### Secure Boot blocking driver

If the Nvidia kernel module fails to load and **Secure Boot is enabled** in BIOS, the unsigned driver will be blocked.

**Solution:**
- Disable Secure Boot in your BIOS/UEFI settings (usually under Security or Boot tab)
- Reboot

---

## 📝 Quick Reference — Command Summary

```bash
# Install prerequisites
sudo apt install linux-headers-$(uname -r) dkms

# Install Nvidia driver
sudo apt install nvidia-driver-590-open

# Disable Wayland (enable X11)
sudo nano /etc/gdm3/custom.conf  # set WaylandEnable=false

# Switch to LightDM
sudo apt install lightdm && sudo dpkg-reconfigure lightdm

# Verify driver loaded
nvidia-smi

# Verify kernel module built
dkms status

# List detected displays
xrandr --query

# Force-enable a display
xrandr --output HDMI-0 --auto

# Graphical monitor configuration
nvidia-settings
```

---

## 🖥️ System Configuration

**Tested on:**
- **OS:** Ubuntu 24.04 LTS
- **Kernel:** 6.17
- **GPU:** Nvidia RTX 3070 (GA104)
- **Driver:** 590.48.01
- **Display Manager:** LightDM

---

## 📚 Additional Resources

- [Nvidia Linux Driver Installation Guide](https://docs.nvidia.com/cuda/cuda-installation-guide-linux/)
- [Ubuntu Nvidia Driver Documentation](https://help.ubuntu.com/community/BinaryDriverHowto/Nvidia)
- [Xrandr Manual](https://www.x.org/wiki/Projects/XRandR/)

---

<p align="center">
  <strong>Successfully configured? Share your setup!</strong>
</p>

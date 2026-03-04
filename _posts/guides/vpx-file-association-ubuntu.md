# VPX File Association & Icon Setup on Ubuntu 24.04

Associate `.vpx` files with VPinballX BGFX and add a custom icon in the file manager.

<p align="center">
  <img src="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/linux-cab/vpinball.png" alt="VPinball Icon" width="100">
</p>

---

## Paths Used in This Guide

| Item | Path |
|------|------|
| VPinballX BGFX | `/home/yourusername/VPX/VPinballX_BGFX` |    
| Icon source | `/home/yourusername/Pictures/vpinball.png` |
| VPX tables | `/home/yourusername/VPX/tables/` |

<h><mark>Replace `yourusername` with your actual Linux username (e.g. `mf`).</mark></h>

---

## Step 1 — Copy the Icon

```bash
# Create icon directories
mkdir -p ~/.local/share/icons/hicolor/48x48/mimetypes

# Copy icon to your local icons folder
cp ~/Pictures/vpinball.png ~/.local/share/icons/vpinball.png

# Copy to hicolor (fallback)
sudo cp ~/Pictures/vpinball.png /usr/share/icons/hicolor/48x48/mimetypes/application-x-vpinball.png

# Copy to Yaru (Ubuntu 24.04 default theme — required!)
sudo cp ~/Pictures/vpinball.png /usr/share/icons/Yaru/48x48/mimetypes/application-x-vpinball.png
```

> **Note:** Ubuntu 24.04 uses the **Yaru** icon theme by default. Without copying the icon there, it will not appear on `.vpx` files in the file manager even if everything else is configured correctly.

---

## Step 2 — Register the MIME Type

```bash
mkdir -p ~/.local/share/mime/packages

cat > ~/.local/share/mime/packages/vpinball.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
  <mime-type type="application/x-vpinball">
    <comment>Visual Pinball Table</comment>
    <icon name="application-x-vpinball"/>
    <glob pattern="*.vpx"/>
  </mime-type>
</mime-info>
EOF

# Install system-wide
sudo cp ~/.local/share/mime/packages/vpinball.xml /usr/share/mime/packages/vpinball.xml
```

---

## Step 3 — Create the Desktop Entry

```bash
cat > ~/.local/share/applications/vpinball.desktop << 'EOF'
[Desktop Entry]
Name=VPinballX BGFX
Exec=/home/yourusername/VPX/VPinballX_BGFX %f
Icon=/home/yourusername/.local/share/icons/vpinball.png
Type=Application
MimeType=application/x-vpinball;
Categories=Game;
EOF
```

> Remember to replace `yourusername` with your actual username.

---

## Step 4 — Set as Default & Refresh

```bash
# Rebuild MIME database
sudo update-mime-database /usr/share/mime
update-mime-database ~/.local/share/mime

# Rebuild icon caches
sudo gtk-update-icon-cache /usr/share/icons/hicolor --force
sudo gtk-update-icon-cache /usr/share/icons/Yaru --force

# Update desktop database
update-desktop-database ~/.local/share/applications

# Set VPinballX as default for .vpx files
xdg-mime default vpinball.desktop application/x-vpinball

# Restart file manager
nautilus -q && nautilus &
```

---

## Verify It Worked

```bash
# Should return: application/x-vpinball
xdg-mime query filetype ~/VPX/tables/yourtable.vpx

# Should show the .vpx glob
grep "vpx" /usr/share/mime/globs2
```

---

## Result

- `.vpx` files show the VPinball icon in Nautilus
- Right-click → Open With → **VPinballX BGFX** appears in the list
- Double-clicking a `.vpx` file launches VPinballX directly

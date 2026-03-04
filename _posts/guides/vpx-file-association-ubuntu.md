# VPX File Association & Icon Setup on Ubuntu 24.04

Associate `.vpx` files with VPinballX BGFX and add a custom icon in the file manager.

---
<img src="https://github.com/MajorFrenchy/MajorFrenchy.github.io/blob/main/Screenshots/linux-cab/Visual_Pinball_X_logo.png" 
     width="50%"
     alt="Screenshot">

## Requirements

- VPinballX BGFX installed at `/home/mf/Downloads/VPX/VPinballX_BGFX`
- A `vpinball.png` icon image

---

## Step 1 — Set Up Icon

```bash
mkdir -p ~/.local/share/icons/hicolor/48x48/mimetypes
mkdir -p ~/.local/share/icons

# Copy your PNG icon
cp /path/to/vpinball.png ~/.local/share/icons/vpinball.png
cp ~/.local/share/icons/vpinball.png ~/.local/share/icons/hicolor/48x48/mimetypes/application-x-vpinball.png
```



---

## Step 2 — Register the MIME Type

```bash
mkdir -p ~/.local/share/mime/packages

cat > ~/.local/share/mime/packages/vpinball.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
  <mime-type type="application/x-vpinball">
    <comment>Visual Pinball Table</comment>
    <icon name="vpinball"/>
    <glob pattern="*.vpx"/>
  </mime-type>
</mime-info>
EOF
```

---

## Step 3 — Create the Desktop Entry

```bash
cat > ~/.local/share/applications/vpinball.desktop << 'EOF'
[Desktop Entry]
Name=VPinballX BGFX
Exec=/home/mf/Downloads/VPX/VPinballX_BGFX %f
Icon=/home/mf/.local/share/icons/vpinball.png
Type=Application
MimeType=application/x-vpinball;
Categories=Game;
EOF
```

---

## Step 4 — Set as Default & Refresh

```bash
update-mime-database ~/.local/share/mime
update-desktop-database ~/.local/share/applications
gtk-update-icon-cache ~/.local/share/icons/hicolor
xdg-mime default vpinball.desktop application/x-vpinball
```

Restart the file manager to apply changes:

```bash
nautilus -q && nautilus &
```

---

## Result

- `.vpx` files show the VPinball icon in Nautilus
- Right-click → Open With → **VPinballX BGFX** appears in the list
- Double-clicking a `.vpx` file launches VPinballX directly

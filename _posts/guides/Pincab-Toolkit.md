# Pincab Toolset Tk Guide
<br>

<img src="https://github.com/MajorFrenchy/MajorFrenchy.github.io/blob/main/Screenshots/Pincab-Toolkit/logoToolset.png" >

## Table of Contents

### Core Overview

- [What This Tool Is For](#what-this-tool-is-for)
- [How To Think About The App](#how-to-think-about-the-app)
- [Common UI Elements](#common-ui-elements)
- [Tab-By-Tab Deep Dive](#tab-by-tab-deep-dive)

### Hardware Tabs

- [Wemos Tab](#wemos-tab)
- [Teensy Tab](#teensy-tab)
- [LEDWiz Tab](#ledwiz-tab)
- [KL25Z / Pinscape Tab](#kl25z--pinscape-tab)
- [Pico Tab](#pico-tab)
- [Arnoz Tab](#arnoz-tab)
- [Sainsmart Tab](#sainsmart-tab)
- [Cabinet Configurator Tab](#cabinet-configurator-tab)
- [About Tab](#about-tab)

### Workflows & Help

- [Recommended Beginner Workflow](#recommended-beginner-workflow)
- [Troubleshooting Notes](#troubleshooting-notes)
- [Suggested Image Labels](#suggested-image-labels)

---

## What This Tool Is For

Pincab Toolset Tk is a setup and testing utility for virtual pinball cabinet hardware. It brings the main cabinet tasks into one place so you can detect devices, flash firmware, test outputs, inspect inputs, configure mappings, and build cabinet configuration files without jumping between multiple tools.

It is aimed at cabinet builders using hardware such as:

- Wemos / ESP-based addressable LED controllers
- Teensy LED controllers
- LEDWiz-compatible devices
- KL25Z / Pinscape boards
- Raspberry Pi Pico / Pinscape Pico
- Arnoz boards
- Sainsmart relay boards

It also includes a Cabinet Configurator so detected hardware and addressable LED strip layouts can be turned into a `cabinet.xml` style configuration workflow.

[IMAGE PLACEHOLDER: Main app screenshot]

---

## How To Think About The App

The app is organized by hardware type and workflow:

- Some tabs are for flashing firmware.
- Some tabs are for testing outputs.
- Some tabs are for reading inputs and assigning controls.
- Some tabs are for building cabinet configuration data.
- The log area at the bottom shows exactly what the app is doing.

In general, the workflow is:

1. Detect the device.
2. Read device info.
3. Flash firmware or config if needed.
4. Run output tests or input tests.
5. Save the settings into the cabinet configuration.

---

## Common UI Elements

### Detect

Usually scans USB and/or serial ports and tries to match a supported device.

### Read Info

Shows a summary of what the app sees: port, firmware files, USB IDs, paths, device type, and related hardware details.

### Flash

Used when a device needs firmware or configuration written to it.

### Test Buttons

These send real commands to the selected controller so you can verify the hardware responds correctly.

### Create / Access Buttons

These help with Linux permission or serial-access setup where needed.

### Log

The log is important. If a device does not work, the log usually shows whether the problem is:

- USB detection
- serial detection
- permission access
- firmware tool missing
- controller command timeout

[IMAGE PLACEHOLDER: Log panel screenshot]

---

## Tab-By-Tab Deep Dive

---

## Wemos Tab <br>
<img src="https://github.com/MajorFrenchy/MajorFrenchy.github.io/blob/main/Screenshots/Pincab-Toolkit/wemos.png" 
     width="100%"
     alt="Screenshot"> <br>

Purpose: manage ESP/Wemos-based addressable LED controllers.

Typical uses:

- detect the Wemos serial port
- flash Wemos firmware
- test addressable LED outputs
- verify controller communication

[IMAGE PLACEHOLDER: Wemos tab screenshot]

### Fields and Options

#### Serial Port

The serial device used for communication with the Wemos, for example `/dev/ttyUSB0`.

#### Firmware

A firmware file from the Wemos firmware folder.

#### Baud

Communication speed used for controller communication and some flash/test operations.

#### Erase Flash First

If enabled, the device flash is erased before writing firmware. Useful when changing firmware versions or clearing bad state.

#### Save state for cabinet.xml

Allows the Wemos device state to be reused by the Cabinet Configurator detection workflow.

### Buttons

#### Detect

Finds the matching Wemos serial port and selects it.

#### Read Wemos Info

Shows detected port, baud, selected firmware, available firmware files, and likely USB matches.

#### Flash Wemos

Uses `esptool` to write firmware to the controller.

#### Chase Test

Runs a moving LED pattern across outputs and LEDs in sequence. Good for checking direction and controller responsiveness.

#### Pulse Test

Flashes all LEDs in repeating bursts. Good for simple "does this controller respond" verification.

#### Random Test

Sends randomized color motion patterns. Good for quick stress-style visual testing.

#### Wemos Access

Shows Linux access/setup commands for serial permissions and related setup.

### What To Use It For

Use Wemos when you want to confirm:

- the board is found on USB
- the board has the right firmware
- the LED output controller is alive
- the serial connection works at the expected baud rate

---

## Teensy Tab<br>
<img src="https://github.com/MajorFrenchy/MajorFrenchy.github.io/blob/main/Screenshots/Pincab-Toolkit/teensy.png" 
     width="100%"
     alt="Screenshot"> <br>
<br>

Purpose: manage Teensy-based LED strip controllers.

[IMAGE PLACEHOLDER: Teensy tab screenshot]

### Fields and Options

#### Serial Port

Selected Teensy serial port.

#### Firmware

Firmware file for Teensy flashing.

#### MCU

Teensy model selection, such as `TEENSY32` or `TEENSY40`.

#### Save state for cabinet.xml

Lets the Cabinet Configurator reuse the detected Teensy.

### Buttons

#### Detect

Finds likely Teensy serial hardware.

#### Read Teensy Info

Shows Teensy-related serial and USB details.

#### Flash Teensy

Flashes the selected `.hex` firmware using the Teensy loader tool.

#### Create Udev Rule

Linux helper for device access.

#### Chase Test

Sequential LED chase test.

#### Pulse Test

All-on/all-off pulse pattern.

#### Random Test

Randomized output activity pattern.

### What To Use It For

Use Teensy when you need:

- firmware loaded to the controller
- confirmation the controller is reachable
- quick hardware verification for LED strips

---

## LEDWiz Tab
<br>
<img src="https://github.com/MajorFrenchy/MajorFrenchy.github.io/blob/main/Screenshots/Pincab-Toolkit/ledwiz
     .png" 
     width="100%"
     alt="Screenshot"> <br>
<br>

Purpose: detect and test LEDWiz-compatible output devices.

[IMAGE PLACEHOLDER: LEDWiz tab screenshot]

### Main Features

- detects LEDWiz-compatible USB devices
- gives quick access to a 32-port output tester
- lets you pulse individual ports

### Fields and Options

#### Pulse (ms)

How long the selected output stays active during a pulse test.

#### Device Selector

Selects the detected LEDWiz-compatible device.

### Buttons

#### Detect

Scans for supported LEDWiz-compatible hardware.

#### Port Buttons 1-32

Each button pulses a single output.

### What To Use It For

Use LEDWiz when you want to verify:

- the device appears on USB
- each output port can be triggered
- the board is responding before integrating it into the cabinet config

---

## KL25Z / Pinscape Tab

<br>
<img src="https://github.com/MajorFrenchy/MajorFrenchy.github.io/blob/main/Screenshots/Pincab-Toolkit/kl25z.png" 
     width="100%"
     alt="Screenshot"> <br>
<br>

Purpose: test and configure KL25Z-based Pinscape hardware.

[IMAGE PLACEHOLDER: KL25Z tab screenshot]

### Major Capabilities

- detect KL25Z hardware
- read controller/device info
- test outputs
- test and observe inputs
- save/load local configuration mappings
- flash config to the controller

### Fields and Areas

#### Device Selector

The currently selected KL25Z device.

#### Pulse (ms)

Pulse duration for output tests.

#### Ports

Number of ports shown in the output test view.

#### Config Summary

Shows whether a config is loaded.

#### Output Test

Lets you pulse output ports and assign output roles.

#### Input Test

Lets you monitor buttons and assign input roles.

#### Plunger Axis

Used for plunger-related input interpretation.

### Buttons

#### Detect Pinscape USB

Finds the KL25Z.

#### Read Pinscape Info

Shows controller details.

#### Create Udev Rule

Linux access helper.

#### Open Output Test

Opens the output tester.

#### Save input/output assignments

Stores local mapping information.

#### Load Pinscape Config

Loads config JSON from disk.

#### Flash Config

Writes config mappings to the KL25Z.

### What To Use It For

Use this tab to:

- verify buttons and plunger input behavior
- confirm output ports map correctly
- build or test a KL25Z cabinet control setup

---

## Pico Tab

<br>
<img src="https://github.com/MajorFrenchy/MajorFrenchy.github.io/blob/main/Screenshots/Pincab-Toolkit/pico.png" 
     width="100%"
     alt="Screenshot"> <br>
    

Purpose: manage Raspberry Pi Pico / Pinscape Pico devices.

[IMAGE PLACEHOLDER: Pico tab screenshot]

### Major Capabilities

- detect Pico USB devices
- read device info
- test logical output ports
- read, view, and send Pico config JSON
- flash UF2 firmware
- inspect button mappings
- run input monitoring

### Detection Section

#### Detect Pico USB

Finds Pico and RP2040-class devices.

#### Create Udev Rule

Linux access helper.

#### Device Selector

Shows detected Picos and any matched serial port.

### Output Test Section

#### Protocol

Current supported mode is Pinscape HID / advanced device communication.

#### Baud

Used for serial fallback operations.

#### Ports

Number of output buttons shown.

#### Pulse (ms)

Pulse duration.

#### Refresh Ports

Rebuilds the test button grid.

#### All Off

Turns all visible outputs off.

### Input Tester Section

#### BUTTONS

Starts the input monitor and logical button display.

#### New Config

Creates a new config file from a template.

#### Load Config

Loads a Pico JSON config.

#### Flash Config

Sends the current config to the Pico.

#### Flash UF2

Writes UF2 firmware to a BOOTSEL-mounted Pico.

### Plunger Tools

#### Calibrate Plunger

Starts plunger calibration flow.

#### Apply Calibration

Applies the currently captured calibration state in the UI.

#### Reset Calibration

Resets calibration state.

### Interactive Button Config

This area lets you work with logical button actions and JSON mapping updates.

#### Load Defaults

Loads the default expected cabinet actions.

#### Save Config

Stores local Pico button assignment state.

#### Send To Pico

Merges selected mappings into the active config and sends them to the device.

### Config Upload Area

#### Show Config

Displays the loaded JSON.

#### Read Device JSON

Attempts to fetch JSON from the Pico itself.

#### Save Current Config

Copies current config to another file.

#### Clear Log

Clears the Pico-specific log area.

### Firmware (UF2)

#### Browse UF2

Select a UF2 firmware file.

#### Detect BOOTSEL

Try to find a mounted BOOTSEL drive automatically.

#### Browse Drive

Choose a mounted BOOTSEL target manually.

#### Read Firmware Info

Displays firmware-related information and workflow notes.

#### Flash UF2

Copies the selected UF2 file to the BOOTSEL device.

### What To Use It For

Use the Pico tab when you want:

- modern RP2040-based controller management
- JSON-based button mapping work
- output and input testing
- firmware replacement through UF2

---

## Arnoz Tab
<br>
<img src="https://github.com/MajorFrenchy/MajorFrenchy.github.io/blob/main/Screenshots/Pincab-Toolkit/pico.png" 
     width="100%"
     alt="Screenshot"> <br>

Purpose: manage and test Arnoz output controller hardware.

[IMAGE PLACEHOLDER: Arnoz tab screenshot]

### Major Capabilities

- detect Arnoz hardware
- choose transport mode
- test outputs
- run command-specific board functions

### Common Options

#### Transport

Selects the communication path, such as HID or serial.

#### Serial Port / Baud

Used when serial transport is selected.

#### Board

Select the board type/profile.

#### Pulse (ms)

Pulse timing.

#### First Output

Starting output number for mapped testing.

### What To Use It For

Use Arnoz when you want to:

- confirm the board is visible
- test mapped outputs
- verify response using board-specific control methods

---

## Sainsmart Tab
<br>
<img src="https://github.com/MajorFrenchy/MajorFrenchy.github.io/blob/main/Screenshots/Pincab-Toolkit/saintsmart.png" 
     width="100%"
     alt="Screenshot"> <br>

Purpose: manage Sainsmart relay board integration.

[IMAGE PLACEHOLDER: Sainsmart tab screenshot]

### Major Capabilities

- detect Sainsmart-compatible boards
- test relay outputs
- map channel roles
- export Sainsmart data into cabinet configuration workflows

### Common Options

#### Transport / Serial Details

Used depending on the connected board type.

#### Pulse (ms)

Relay pulse duration.

#### Channel Mapping

Used to assign relay outputs to pinball cabinet functions.

### Buttons

#### Detect

Finds the board.

#### Test Output Buttons

Lets you fire relays individually.

#### Export cabinet.xml

Exports the Sainsmart section to cabinet XML.

### What To Use It For

Use Sainsmart when your cabinet uses relay outputs for:

- contactors
- knockers
- shaker motor relays
- other switched effects

---

## Cabinet Configurator Tab
<br>
<img src="https://github.com/MajorFrenchy/MajorFrenchy.github.io/blob/main/Screenshots/Pincab-Toolkit/cabconfig.png" 
     width="100%"
     alt="Screenshot"> <br>
     
Purpose: assemble cabinet controller and strip layout data into configuration output.

[IMAGE PLACEHOLDER: Cabinet Configurator main screenshot]

This tab is where the full cabinet model comes together.

### Major Areas

#### Cabinet Preview
<br>
<img src="https://github.com/MajorFrenchy/MajorFrenchy.github.io/blob/main/Screenshots/Pincab-Toolkit/cab xml.png" 
     width="100%"
     alt="Screenshot"> <br>

Visual preview area for the configurator.

#### Cabinet Actions

Top-level actions like detect, save, load, import, export.

#### Addressable LED

Launcher for addressable LED strip/controller setup and testing.

#### cabinet.xml Preview

Generated output preview area.

### Cabinet Actions Buttons

#### Detect

Opens a device detection popup so you can choose which hardware should be included in the cabinet model.

#### Addressable LED

Opens tools for strip/controller setup and testing.

#### Generate cabinet file

Writes the cabinet XML file.

#### Load cabinet file

Loads an existing cabinet file.

#### Import Sainsmart Settings

Pulls Sainsmart mapping state into the cabinet config.

#### Export GlobalConfig_B2SServer.xml

Exports the related global config file.

### Detect Devices Popup

You can choose whether to include:

- Wemos
- Teensy
- Sainsmart
- Addressable LED

This is used to build the set of controllers that should be represented in the cabinet model.

[IMAGE PLACEHOLDER: Detect Devices popup]

### Addressable LED Tools

The Addressable LED tools are split into configuration and testing.

#### Configure ALED Strips


Manage strip definitions, directions, lengths, controller assignment, brightness, and port routing.

#### Test

Open the controller test popup.

<img src="https://github.com/MajorFrenchy/MajorFrenchy.github.io/blob/main/Screenshots/Pincab-Toolkit/aled test.png" 
     width="100%"
     alt="Screenshot"> <br>
### Controller Concepts

Each addressable LED controller includes settings like:

- controller name
- controller type
- COM port
- baud rate
- timeout
- DTR
- handshake waits
- compression
- test on connect
- per-strip length behavior

### Strip Concepts
<br>
<img src="https://github.com/MajorFrenchy/MajorFrenchy.github.io/blob/main/Screenshots/Pincab-Toolkit/add strip.png" 
     width="100%"
     alt="Screenshot"> <br>

Each strip includes:

- strip name
- width
- height / LED count
- arrangement / direction
- color order
- first LED number
- fading curve name
- brightness
- output controller name
- output input / port

### Strip Direction Preview

This helps visualize how the strip numbering will run physically.

[IMAGE PLACEHOLDER: Strip direction preview]

### Addressable LED Test Popup

Lets you choose a controller and run:

- Detect
- Chase Test
- Pulse Test
- Random Preview

This is useful for verifying the controller and strip behavior from the cabinet context.

[IMAGE PLACEHOLDER: ALED Test popup]

### What To Use It For

Use Cabinet Configurator when you want to:

- assemble your full hardware layout
- define LED strip ordering and routing
- generate cabinet configuration output
- test addressable LED controllers in cabinet context

---

## About Tab

Purpose: overview of the project and support link.

[IMAGE PLACEHOLDER: About tab screenshot]

### What It Includes

- overview text describing the purpose of Pincab Toolset
- About image area
- Patreon support image / link

Use it as a summary page and support/info page rather than a hardware tool page.

---

## Recommended Beginner Workflow

### If You Are Starting Fresh

1. Open the tab for your controller type.
2. Use `Detect`.
3. Use `Read Info`.
4. Flash firmware if required.
5. Run a simple test like `Pulse Test`.
6. Move to Cabinet Configurator once the hardware responds correctly.
7. Generate your cabinet configuration.

### If Hardware Is Not Responding

Check, in order:

1. Is the USB device detected?
2. Is the correct serial port selected?
3. Are Linux permissions correct?
4. Is the firmware loaded?
5. Is the correct baud rate being used?
6. Does the log show timeout, missing tool, or unsupported device?

---

## Troubleshooting Notes

### Device Detected But No Response

Usually means USB/serial enumeration works, but the controller firmware or command protocol is not responding.

### Flash Tool Missing

For Wemos and Teensy, make sure the required external flashing tool exists in the runtime.

### Permissions Problems

On Linux, serial access often depends on:

- `dialout` group membership
- device rules / access setup
- relogging after permission changes

### Config Problems

If JSON loads but actions do not behave correctly, verify:

- source mapping
- logical button assignment
- controller type
- output port numbering

---

## Suggested Image Labels

Use these labels when you add pictures later:

- `[IMAGE PLACEHOLDER: Main app screenshot]`
- `[IMAGE PLACEHOLDER: Wemos tab screenshot]`
- `[IMAGE PLACEHOLDER: Teensy tab screenshot]`
- `[IMAGE PLACEHOLDER: LEDWiz tab screenshot]`
- `[IMAGE PLACEHOLDER: KL25Z tab screenshot]`
- `[IMAGE PLACEHOLDER: Pico tab screenshot]`
- `[IMAGE PLACEHOLDER: Arnoz tab screenshot]`
- `[IMAGE PLACEHOLDER: Sainsmart tab screenshot]`
- `[IMAGE PLACEHOLDER: Cabinet Configurator main screenshot]`
- `[IMAGE PLACEHOLDER: Detect Devices popup]`
- `[IMAGE PLACEHOLDER: Addressable LED tools popup]`
- `[IMAGE PLACEHOLDER: Strip direction preview]`
- `[IMAGE PLACEHOLDER: ALED Test popup]`
- `[IMAGE PLACEHOLDER: About tab screenshot]`

---
layout: post
title: "VPX Merging Tool"
date: 2026-02-20
categories: [Software, Pinball]
image: /Screenshots/vpx-merging-tool/vpxmt.png
---

<img src="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/vpx-merging-tool/vpxmt.png" 
     style="width: 50%; height: auto;" 
     alt="VPX Merging Tool">

VPXmerge streamlines your VPX table collection by automating exports, script fixes, media organization, and asset detection — all with an intuitive 
drag-and-drop interface.
     
<br>
<br>

🎯 One-Click Full Export — VPX + VBS + Backglass + PUP + Media<br>
🔧 Auto-Fix Scripts — WScript.Shell, RegRead, deprecated B2S properties<br>
🎬 Smart Media Manager — Fuzzy matching for POPMedia files<br>
🖼️ Live Table Previews — See table artwork while you work<br>
📦 Batch Processing — Handle entire collections at once<br>
🎮 ROM Detection — 3-tier fallback for maximum compatibility<br>
📝 VBS Extraction — Pull scripts from VPX files safely
<br>
<br>

## PURPOSE OF THE TOOL
<br>
This is to merge you existing Virtual pinball tables and media collection to a VPX Standalone "ready" format. The Standalone uses a 1 folder structure with all required files. This tool will scan the required files for a specific table (.VPX) and list all the required files such as 
- Backglass
- ROM
- altcolor
- altsound
- Pup packs
- Pinup Media files
- music

  It will gather the above from your Windows setup or your Backup drive as long as the folder structure is existing.

  ## HOW TO USE THE TOOL?

<a href="https://www.youtube.com/watch?v=ANuKqiN80LA">
  <img src="https://img.youtube.com/vi/ANuKqiN80LA/hqdefault.jpg" 
       alt="Watch the video" 
       style="width: 50%; height: auto; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.3);">
</a>
<br>
Check the video tutorial
<br>
<br>

## STEPS
1- Set your SOURCE folder and TARGET<br>
<img src="/Screenshots/vpx-merging-tool/vpxmt-source.jpg" width="25%"> 
<br><br>
2- Drag your VPX to the software box where it say " DROP .VPX HERE "
<br><br>
3- if an image preview is available it will display the table preview
<br><br>
4- there is a Globe on the right side of the table title in the picture preview box. This will take you to the table in virtualpinballspreadsheet
<br><br>
<img src="/Screenshots/vpx-merging-tool/vpxmt-globe.jpg" width="25%"> <br>
5- You can select to export your Table media check the box and pick the folder structure you want.
<br>
<br>
<img src="/Screenshots/vpx-merging-tool/vpxmt-media.jpg" width="100%"> 
<br><br>
6- The Audit window will tell you what files were detected on your system<br>
<img src="/Screenshots/vpx-merging-tool/vpxmt-audit.jpg" width="100%"> 
<br><br>
7- Click the Make magic Happen to launch the Merging tool. It will copy all files in a single folder ready for VPX Standalone. 
<br><br>
<img src="/Screenshots/vpx-merging-tool/vpxmt-magic.jpg" width="100%"> 
<br><br>
After the copy, you will see a summary of all copied files <br><br>
<img src="/Screenshots/vpx-merging-tool/vpxmt-summary.jpg" width="100%"> 
8- The folder and all files will now be in your target folder. The media files will be renamed based on the type of media you selected from the drop down menu.
<br>
<img src="/Screenshots/vpx-merging-tool/vpxmt-target.jpg" width="100%">
<br><br>

## Clean VBS
<br>
<img src="/Screenshots/vpx-merging-tool/vpxmt-script.jpg" width="100%">
<br>
 This option allows you to extract the Table script with 1 click of a button. It will be renaming the .vbs to match the .VPX <br>
 <img src="/Screenshots/vpx-merging-tool/vpxmt-vbs.jpg" width="100%">
 <br>
In VPX Standalone, you can not access the script directly anymore. This tool will allow you to export a clean version of the table script. Sometimes, you 
may need to enable an option, change the rom name or edit a specific line. 
<img src="/Screenshots/vpx-merging-tool/vpxmt-vbs-full.jpg" width="50%">

<br>

## Fix Script <br>
<img src="/Screenshots/vpx-merging-tool/vpxmt-fix.jpg" width="50%">

<br>
VPX tables were built using windows infrastructure like VBS, .NET a lot of table patches were already made by members of the community and they are being hosted on JSM74's Giuhub. <a href="https://github.com/jsm174/vpx-standalone-scripts">VPX Standalone Scripts</a>
<br> 

<img src="/Screenshots/vpx-merging-tool/vpxmt-sscripts.jpg" width="100%">
<br>
     
The software automatically looks for it and if there is a match, it will download it automatically. Sometimes, certain tables will crash and there is no patch for it . Clicking the Fix script will scan and list the table issues . If it detects any issues , it will create a .VBS script 
with the corrections. 
<br>
<img src="/Screenshots/vpx-merging-tool/vpxmt-sscripts.jpg" width="100%">
<br>


<br>
Auto-Fix Script Logic
<br>
What It Fixes: VPX Standalone doesn't support certain Windows-specific features that desktop VPX uses. The auto-fixer removes or replaces these incompatible code patterns.
<br>
1. WScript.Shell Registry Reads
* Problem: Desktop VPX reads Windows registry to find NVRAM folder path
* Fix: Replace GetNVramPath() function to use local .\pinmame\nvram\ folder instead
* Action: Completely rewrites the function to return a hardcoded local path
<br>
<br>
2. WScript.Shell CreateObject
* Problem: Creates Windows shell objects (not supported in VPX Standalone)
* Fix: Comments out any line containing CreateObject("WScript.Shell")
* Action: Adds ' comment marker and explanation
<br> <br>

3. RegRead Calls
* Problem: Reads Windows registry values (registry doesn't exist on Linux/Android)
* Fix: Comments out lines containing RegRead(
* Action: Adds ' comment marker with explanation
<br>
<br>
4. Const cGameName Declaration
* Problem: Old table format declares Const cGameName = "rom_name"
* Fix: Replaces with modern format: Const cGameName = "rom_name" : cAltGameName = ""
* Action: Adds empty cAltGameName variable for compatibility
<br>
<br>
5. Table1_Exit() Sub
* Problem: Desktop VPX uses Table1_Exit() to clean up on close
* Fix: Renames to Table1_Paused() (VPX Standalone equivalent)
* Action: Changes function name while keeping all code inside unchanged
<br>
<br>

Result:
* Script runs on VPX Standalone without Windows dependencies
* All fixes are logged in audit output
* Original problematic code is commented out (not deleted) for reference

<br>



















---
layout: post
title: "VPinFE MacOS"
date: 2026-03-05
categories: [Front-end, Pinball, Mac]
image: /Screenshots/VpinFE/VPinFE.jpg
---

This is a Cross-Platform Front End for Virtual Pinball. This post is about setting it up on MacOS <br>

<a href="https://www.youtube.com/watch?v=YD4eZIqHypw">
  <img src="https://img.youtube.com/vi/YD4eZIqHypw/hqdefault.jpg" 
       alt="Watch the video" 
       style="width: 70%; height: auto; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.3);">
</a>

  <h1>Youtube Video Tutorial</h1>



This Front end is running using a self contained version of Python using a Chromium browser. 

- Download the software. <a href="https://github.com/superhac/vpinfe/actions">VPinFE Runs</a> ( You must log in to Github ) <br><br>

<img src="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/VpinFE/VPinFE-download.jpg" 
     width="75%"
     alt="Screenshot"><br><br>
- Install the program by dragging the icon to the Application folder.


<img src="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/VpinFE/VPinFE-app.jpg" 
     width="75%"
     alt="Screenshot"><br><br><br>

- Running the software for the 1st time will trigger a security warning. Go to your System Settings / Privacy and security and allow it to run. <br><br>
<img src="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/VpinFE/VPinFE-privacy.jpg" 
     width="75%"
     alt="Screenshot">
     <br><br><br>

If you want to access the setting screen, you can access it by typing 127.0.0.1:8001<vr>
If it is on a different device, you will need your VpinFE computer IP address and type it IE: 192.168.1.113:8001

<img src="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/VpinFE/VPinFE-url.jpg" 
     width="75%"
     alt="Screenshot">
    <br><br>
 
    
- The 1st time, you will need to set your monitors in the settings menu <br><br>

<img src="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/VpinFE/VPinFE-monitors.jpg" 
     width="75%"
     alt="Screenshot"><br><br><br>

- Set the path for your VPX Standalone location / Tables / VPinbsallX.ini
The default folders for those are as follow:

<br>
vpxbinpath = /Applications/VPinballX_BGFX.app/Contents/MacOS/VPinballX_BGFX <br><br>
tablerootdir = /Users/YOURUSERNAME/Desktop/vpinball/ <br><br>
vpxinipath = /Users/YOURUSERNAME/Library/Application Support/VPinballX/10.8/VPinballX.ini <br><br>
<br>
<img src="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/VpinFE/VPinFE-settings.jpg" 
     width="75%"
     alt="Screenshot"><br><br><br>

- Pick a theme by activating it. 
<br>
<img src="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/VpinFE/VPinFE-theme.jpg" 
     width="75%"
     alt="Screenshot"><br><br><br>

- Cab Theme

<br>
<img src="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/VpinFE/VPinFE cab.jpg" 
     width="75%"
     alt="Screenshot"><br><br><br>
     

     
- Tables
<br>
<img src="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/VpinFE/VPinFE-Tables.jpg" 
     width="75%"
     alt="Screenshot"><br><br><br>

<br>
<img src="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/VpinFE/VPinFE-vpx.jpg" 
     width="75%"
     alt="Screenshot"><br><br><br>

<h1>Adding tables</h1>

in order to run the software properly, you need to have your VPX table in a standalone structure <br>
<img src="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/VpinFE/VPinFE-folderstructure.jpg" 
     width="75%"
     alt="Screenshot">
     <br><br><br>

  You need to add your tables Directory in the folder you set in tablerootdir = /Users/YOURUSERNAME/Desktop/vpinball/ <br><br>

In the Manager UI click on tables Unmatched button to add it to your library<br>

<img src="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/VpinFE/VPinFE-unmatched.jpg" 
     width="75%"
     alt="Screenshot"><br><br><br>

This will bring you the the matching menu.  <br>
*** Your table has to be associated to the VirtualPinballSpreadsheet Table ID in order for VPinFE to download the proper media. <br> <br>

You will see a "use my own media" button. use this if you already have media for the table you want to associate. 
<img src="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/VpinFE/VpinFE-mymedia.jpg" 
     width="75%"
     alt="Screenshot">
     <br><br><br>
Then see if your table is matching against the VPS database. Remove characters until you get a match and select Associate
<br>
<img src="https://raw.githubusercontent.com/MajorFrenchy/MajorFrenchy.github.io/main/Screenshots/VpinFE/VpinFE-associate.jpg" 
     width="75%"
     alt="Screenshot">
     <br><br><br>

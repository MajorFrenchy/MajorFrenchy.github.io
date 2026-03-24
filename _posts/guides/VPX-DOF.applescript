use scripting additions

on open theFiles
  runWithFiles(theFiles)
end open

on run argv
  if (count of argv) > 0 then
    runWithFiles(argv)
  else
    runWithFiles({})
  end if
end run

on runWithFiles(theFiles)
  set cmd to "/Applications/VPinballX_BGFX.app/Contents/MacOS/VPinballX_BGFX"
  set logPath to "/tmp/vpx-dof.log"

  set args to ""
  repeat with f in theFiles
    set args to args & " " & quoted form of my toPosix(f)
  end repeat

  set shellPrefix to "HOME=/Users/MF USER=MF LOGNAME=MF DOF_TRACE_INPUT=1 DOF_FORCE_OFF_MS=1200 "

  try
    set d to do shell script "/bin/date"
    set stamp to "---- " & d & " ----"
    set filesLine to "FILES: " & ((count of theFiles) as string)

    do shell script "/bin/echo " & quoted form of stamp & " >> " & quoted form of logPath
    do shell script "/bin/echo " & quoted form of filesLine & " >> " & quoted form of logPath
    do shell script "sudo -n env " & shellPrefix & quoted form of cmd & args & " >> " & quoted form of logPath & " 2>&1"

    display notification "VPX-DOF launched" with title "VPX-DOF"
  on error errMsg number errNum
    set errLine to "ERROR " & errNum & ": " & errMsg
    do shell script "/bin/echo " & quoted form of errLine & " >> " & quoted form of logPath
    display notification "VPX-DOF error" with title "VPX-DOF"
  end try
end runWithFiles

on toPosix(p)
  try
    return POSIX path of p
  on error
    return p
  end try
end toPosix

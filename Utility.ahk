Menu, Tray, Icon, wrench.ico

; File Explorer Snapping

#e:: ; Win+E hotkey
    Run explorer.exe shell:Downloads
    WinWaitActive ahk_exe explorer.exe
    Send #{Left}
    Sleep 1000 ; Wait for a brief moment
    Send {Escape}
return

#!e:: ; Win+Alt+E hotkey
    Run explorer.exe shell:Downloads
    WinWaitActive ahk_exe explorer.exe
    Send #{Right}
    Sleep 1000 ; Wait for a brief moment
    Send {Escape}
return

!e::
    ; Check if File Explorer is already open
    IfWinExist ahk_class CabinetWClass
    {
        ; If it's open, activate the window
        WinActivate ahk_class CabinetWClass
    }
    Else
    {
        ; If not open, open File Explorer
        Run explorer.exe
    }
return

; Open Program Hotkeys

#n:: 
    Run "C:\Program Files\Notepad++\notepad++.exe"
return

#s:: ; Win+S hotkey
    Run "C:\Users\Admin\AppData\Local\slack\slack.exe"
return

; Navigate Pinned Taskbar Items

F1::Send, #2
return

F2::Send, #3
return

F3::Send, #4
return

F4::Send, #5
return

^o::Send, #5
return

; Pause Script

F12::
    Suspend, On ; Suspend the script
    Sleep, 30000 ; Sleep for 30 seconds (adjust the time as needed)
    Suspend, Off ; Resume the script
return

; Ctrl Cursor Volume

#NoEnv
; #Warn
SendMode Input
SetWorkingDir %A_ScriptDir%

Control & WheelUp::SoundSet, +5
Control & WheelDown::SoundSet, -5

; Notepad++ Hotkeys

!Esc::Send, ^w
return

; Monosnap AutoSnipping

^Numpad1::
    Sleep, 100 ;
    MouseClickDrag, Left, 0, 87, 1880, 1024
return

^Numpad2::
    Sleep, 100 ;
    MouseClickDrag, Left, 4, 41, 1880, 1024
return

;Monosnap restart

::restartmonosnap:: ; Type "restartmonosnap" to close Monosnap and open the application
SetTitleMatchMode, 2
WinClose, Monosnap ahk_exe Monosnap.exe ; Close the window
Process, Close, Monosnap.exe ; Close the background process
Sleep, 5000 ; Wait for 5 seconds (5000 milliseconds)

; Search for Monosnap executable within the specified directory
SetWorkingDir, C:\Users\Admin\AppData\Local\Monosnap
Loop, Files, *Monosnap.exe, F
{
    Run, %A_LoopFileFullPath% ; Open the found executable
    break ; Break out of the loop after the first match
}

return

;Send Alt+F4 for Ctrl+Alt+Esc

^!Escape::Send !{F4}

return

;Windows Virtual Desktop swap on Alt+Arrow

!Right::^#Right

!Left::^#Left
return

;The day I die

::thedayidie:: 
; Read the content of the file
FileRead, content, C:\Users\Admin\Downloads\test.txt
Send, %content%
return

;The week I die

::theweekidie:: 
FileRead, content, C:\Users\Admin\Downloads\test2.txt
Send, %content%
return

; ICO converter
::icoconvert::https://www.icoconverter.com/
return

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

OpenOrSwitchTo(exe_name, application_path, group_name)
{
  IfWinExist, ahk_group %group_name%
    GroupActivate, %group_name%, R
  else
    Run, %application_path%
  Return
}

InsertCurrentTime()
{
  PreviouslyOnClipboard := Clipboard
  FormatTime, Time, A_Now, ddd dd-MM-yyyy HH:mm
  Clipboard := Time
  Send ^v
  Clipboard := PreviouslyOnClipboard
  Return
}

AddToFGroup(ByRef processes, ByRef index)
{
  WinGet, active_id, ID, A
  processes.Push(active_id)

  Return
}

SwitchToFGroup(ByRef processes, ByRef index)
{
  index_process := processes[index]
  if WinActive("ahk_id " . index_process)
  {
    max_index := processes.MaxIndex()
    index := Mod(index, max_index) + 1
  }
  index_process := processes[index]
  WinActivate, ahk_id %index_process%

  Return
}

ClearFGroup(ByRef processes, ByRef index)
{
  processes := []
  index := 1

  Return
}

BrowserExe := "msedge.exe"
BrowserStart := "C:\Program Files (x86)\Microsoft\Edge Beta\Application\msedge.exe --profile-directory=Default"
BrowserGroup := "Browser"

VSCodeExe := "Code.exe"
VSCodeStart := "C:\Users\ricka\AppData\Local\Programs\Microsoft VS Code\Code.exe --new-window"
VSCodeGroup := "VSCode"

TerminalExe := "WindowsTerminal.exe"
TerminalStart := "wt.exe"
TerminalGroup := "Terminal"

EmailStart := "C:\Program Files\Mozilla Thunderbird\thunderbird.exe"
EmailExe := "thunderbird.exe"
EmailGroup := "Email"

global F1Processes := []
global F1Index := 1
global F2Processes := []
global F2Index := 1
global F3Processes := []
global F3Index := 1
global F4Processes := []
global F4Index := 1

GroupAdd, %BrowserGroup%, ahk_exe %BrowserExe%
GroupAdd, %TerminalGroup%, ahk_exe %TerminalExe%
GroupAdd, %VSCodeGroup%, ahk_exe %VSCodeExe%
GroupAdd, %EmailGroup%, ahk_exe %EmailExe%

>!1:: OpenOrSwitchTo(BrowserExe, BrowserStart, BrowserGroup)
>!2:: OpenOrSwitchTo(VSCodeExe, VSCodeStart, VSCodeGroup)
>!3:: OpenOrSwitchTo(TerminalExe, TerminalStart, TerminalGroup)
>!4:: OpenOrSwitchTo(EmailExe, EmailStart, EmailGroup)
>!h:: Send, {^}{Space}
>!t:: InsertCurrentTime()
>!F12:: Reload

^!1:: OpenOrSwitchTo(BrowserExe, BrowserStart, BrowserGroup)
^!2:: OpenOrSwitchTo(VSCodeExe, VSCodeStart, VSCodeGroup)
^!3:: OpenOrSwitchTo(TerminalExe, TerminalStart, TerminalGroup)
^!4:: OpenOrSwitchTo(EmailExe, EmailStart, EmailGroup)
^!h:: Send, {^}{Space}
^!t:: InsertCurrentTime()
^!F12:: Reload

#F1:: AddToFGroup(F1Processes, F1Index)
#F2:: AddToFGroup(F2Processes, F2Index)
#F3:: AddToFGroup(F3Processes, F3Index)
#F4:: AddToFGroup(F4Processes, F4Index)

^F1:: ClearFGroup(F1Processes, F1Index)
^F2:: ClearFGroup(F2Processes, F2Index)
^F3:: ClearFGroup(F3Processes, F3Index)
^F4:: ClearFGroup(F4Processes, F4Index)

^!F1:: SwitchToFGroup(F1Processes, F1Index)
^!F2:: SwitchToFGroup(F2Processes, F2Index)
^!F3:: SwitchToFGroup(F3Processes, F3Index)
^!F4:: SwitchToFGroup(F4Processes, F4Index)

>!F1:: SwitchToFGroup(F1Processes, F1Index)
>!F2:: SwitchToFGroup(F2Processes, F2Index)
>!F3:: SwitchToFGroup(F3Processes, F3Index)
>!F4:: SwitchToFGroup(F4Processes, F4Index)

^!CapsLock:: Send, {CapsLock}
CapsLock:: Send, {Escape}

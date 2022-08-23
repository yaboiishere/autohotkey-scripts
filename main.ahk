﻿#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#IncludeAgain Clip.ahk

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
  FormatTime, Time, A_Now, ddd dd-MM-yyyy HH:mm
  Clip(Time)
  Return
}

InsertCurrentTimeMachineFormat()
{
  FormatTime, Time, % A_NowUTC, yyyy_MM_dd_HHmmss
  Clip(Time)
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

BrowserExe := "chrome.exe"
BrowserStart := "C:\Program Files\Google\Chrome\Application\chrome.exe"
BrowserGroup := "Browser"

VSCodeExe := "Code.exe"
VSCodeStart := "C:\Users\mixai\AppData\Local\Programs\Microsoft VS Code\Code.exe --new-window"
VSCodeGroup := "VSCode"

TerminalExe := "WindowsTerminal.exe"
TerminalStart := "wt.exe"
TerminalGroup := "Terminal"

DiscordExe := "Discord.lnk"
DiscordStart := "C:\Users\mixai\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Discord Inc\Discord.lnk"
DiscordGroup := "Discord"

SpotifyExe := "Spotify.exe"
SpotifyStart := "C:\Program Files\WindowsApps\SpotifyAB.SpotifyMusic_1.191.824.0_x86__zpdnekdrzrea\Spotify.exe"
SpotifyGroup := "Spotify"

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
global F5Processes := []
global F5Index := 1
global F6Processes := []
global F6Index := 1
; global F7Processes := []
; global F7Index := 1
; global F8Processes := []
; global F8Index := 1

GroupAdd, %BrowserGroup%, ahk_exe %BrowserExe%
GroupAdd, %TerminalGroup%, ahk_exe %TerminalExe%
GroupAdd, %VSCodeGroup%, ahk_exe %VSCodeExe%
GroupAdd, %DiscordGroup%, ahk_exe %DiscordExe%
GroupAdd, %SpotifyGroup%, ahk_exe %SpotifyExe%
GroupAdd, %EmailGroup%, ahk_exe %EmailExe%

!1:: OpenOrSwitchTo(BrowserExe, BrowserStart, BrowserGroup)
!2:: OpenOrSwitchTo(VSCodeExe, VSCodeStart, VSCodeGroup)
!3:: OpenOrSwitchTo(TerminalExe, TerminalStart, TerminalGroup)
!4:: OpenOrSwitchTo(DiscordExe, DiscordStart, DiscordGroup)
!5:: OpenOrSwitchTo(SpotifyExe, SpotifyStart, SpotifyGroup)
!6:: OpenOrSwitchTo(EmailExe, EmailStart, EmailGroup)
!h:: Send, {^}{Space}
!t:: InsertCurrentTime()
!n:: InsertCurrentTimeMachineFormat()
!F12:: Reload

; #F1:: AddToFGroup(F1Processes, F1Index)
; #F2:: AddToFGroup(F2Processes, F2Index)
; #F3:: AddToFGroup(F3Processes, F3Index)
; #F4:: AddToFGroup(F4Processes, F4Index)
; #F5:: AddToFGroup(F5Processes, F5Index)
; #F6:: AddToFGroup(F6Processes, F6Index)
; #F7:: AddToFGroup(F7Processes, F7Index)
; #F8:: AddToFGroup(F8Processes, F8Index)

; ^F1:: ClearFGroup(F1Processes, F1Index)
; ^F2:: ClearFGroup(F2Processes, F2Index)
; ^F3:: ClearFGroup(F3Processes, F3Index)
; ^F4:: ClearFGroup(F4Processes, F4Index)
; ^F5:: ClearFGroup(F5Processes, F5Index)
; ^F6:: ClearFGroup(F6Processes, F6Index)
; ^F7:: ClearFGroup(F7Processes, F7Index)
; ^F8:: ClearFGroup(F8Processes, F8Index)

; ^!F1:: SwitchToFGroup(F1Processes, F1Index)
; ^!F2:: SwitchToFGroup(F2Processes, F2Index)
; ^!F3:: SwitchToFGroup(F3Processes, F3Index)
; ^!F4:: SwitchToFGroup(F4Processes, F4Index)
; ^!F5:: SwitchToFGroup(F5Processes, F5Index)
; ^!F6:: SwitchToFGroup(F6Processes, F6Index)
; ^!F7:: SwitchToFGroup(F7Processes, F7Index)
; ^!F8:: SwitchToFGroup(F8Processes, F8Index)

; >!F1:: SwitchToFGroup(F1Processes, F1Index)
; >!F2:: SwitchToFGroup(F2Processes, F2Index)
; >!F3:: SwitchToFGroup(F3Processes, F3Index)
; >!F4:: SwitchToFGroup(F4Processes, F4Index)
; >!F5:: SwitchToFGroup(F5Processes, F5Index)
; >!F6:: SwitchToFGroup(F6Processes, F6Index)
; >!F7:: SwitchToFGroup(F7Processes, F7Index)
; >!F8:: SwitchToFGroup(F8Processes, F8Index)

^!CapsLock:: Send, {CapsLock}
CapsLock:: Send, {Escape}

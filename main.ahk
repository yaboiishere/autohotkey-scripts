﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

OpenOrSwitchTo(exe_name, application_path, group_name)
{
  IfWinExist, ahk_exe %exe_name%
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

BrowserExe := "msedge.exe"
BrowserStart := "C:\Program Files (x86)\Microsoft\Edge Beta\Application\msedge.exe --profile-directory=Default"
BrowserGroup := "Browser"

VSCodeExe := "Code.exe"
VSCodeStart := "C:\Users\ricka\AppData\Local\Programs\Microsoft VS Code\Code.exe --new-window"
VSCodeGroup := "VSCode"

TerminalExe := "WindowsTerminal.exe"
TerminalStart := "wt.exe"
TerminalGroup := "Terminal"

SlackStart := "C:\Users\ricka\AppData\Local\slack\slack.exe"
SlackExe := "Slack.exe"
SlackGroup := "Slack"

DiscordStart := "C:\Users\ricka\AppData\Local\Discord\Update.exe --processStart Discord.exe"
DiscordExe := "Discord.exe"
DiscordGroup := "Discord"

EmailStart := "C:\Program Files\Mozilla Thunderbird\thunderbird.exe"
EmailExe := "thunderbird.exe"
EmailGroup := "Email"

SignalGroup := "Communications"
SignalStart := "C:\Users\ricka\AppData\Local\Programs\signal-desktop\Signal.exe"
SignalExe := "Signal.exe"
ViberStart := "C:\Users\ricka\AppData\Local\Viber\Viber.exe"
ViberExe := "Viber.exe"
ViberGroup := "Communications"

GroupAdd, %BrowserGroup%, ahk_exe %BrowserExe%
GroupAdd, %TerminalGroup%, ahk_exe %TerminalExe%
GroupAdd, %SlackGroup%, ahk_exe %SlackExe%
GroupAdd, %DiscordGroup%, ahk_exe %DiscordExe%
GroupAdd, %VSCodeGroup%, ahk_exe %VSCodeExe%
GroupAdd, %EmailGroup%, ahk_exe %EmailExe%
GroupAdd, %SignalGroup%, ahk_exe %SignalExe%
GroupAdd, %ViberGroup%, ahk_exe %ViberExe%

>!1:: OpenOrSwitchTo(BrowserExe, BrowserStart, BrowserGroup)
>!2:: OpenOrSwitchTo(VSCodeExe, VSCodeStart, VSCodeGroup)
>!3:: OpenOrSwitchTo(TerminalExe, TerminalStart, TerminalGroup)
>!4:: OpenOrSwitchTo(SlackExe, SlackStart, SlackGroup)
>!5:: OpenOrSwitchTo(DiscordExe, DiscordStart, DiscordGroup)
>!6:: OpenOrSwitchTo(EmailExe, EmailStart, EmailGroup)
>!7:: OpenOrSwitchTo(SignalExe, SignalStart, SignalGroup)
>!h:: Send, {^}{Space}
>!t:: InsertCurrentTime()
>!F12:: Reload

^!1:: OpenOrSwitchTo(BrowserExe, BrowserStart, BrowserGroup)
^!2:: OpenOrSwitchTo(VSCodeExe, VSCodeStart, VSCodeGroup)
^!3:: OpenOrSwitchTo(TerminalExe, TerminalStart, TerminalGroup)
^!4:: OpenOrSwitchTo(SlackExe, SlackStart, SlackGroup)
^!5:: OpenOrSwitchTo(DiscordExe, DiscordStart, DiscordGroup)
^!6:: OpenOrSwitchTo(EmailExe, EmailStart, EmailGroup)
^!7:: OpenOrSwitchTo(SignalExe, SignalStart, SignalGroup)
^!h:: Send, {^}{Space}
^!t:: InsertCurrentTime()
^!F12:: Reload

^!CapsLock:: Send, {CapsLock}
CapsLock:: Send, {Escape}

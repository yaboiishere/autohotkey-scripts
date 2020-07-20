#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

GroupAdd, Browser, ahk_exe msedge.exe
GroupAdd, Terminal, ahk_exe WindowsTerminal.exe
GroupAdd, Slack, ahk_exe Slack.exe
GroupAdd, Discord, ahk_exe Discord.exe
GroupAdd, VSCode, ahk_exe Code.exe

>!1:: GroupActivate, Browser, R

>!2:: GroupActivate, VSCode, R

>!3:: GroupActivate, Terminal, R

>!4:: GroupActivate, Slack, R

>!5:: GroupActivate, Discord, R

>!h:: Send, {^}{Space}

>!F12:: Reload

^!1:: GroupActivate, Browser, R

^!2:: GroupActivate, VSCode, R

^!3:: GroupActivate, Terminal, R

^!4::
  IfWinExist, ahk_exe "Slack.exe"
    GroupActivate, Slack, R
  else
    Run, "C:\Users\ricka\AppData\Local\slack\slack.exe"
  Return

^!5::
  IfWinExist, ahk_exe "Discord.exe"
    GroupActivate, Discord, R
  else
    Run, "C:\Users\ricka\AppData\Local\Discord\Update.exe" --processStart Discord.exe
  Return

^!h:: Send, {^}{Space}

^!F12:: Reload

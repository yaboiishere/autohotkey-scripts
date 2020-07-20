#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

GroupAdd, Browser, ahk_exe msedge.exe
GroupAdd, Terminal, ahk_exe WindowsTerminal.exe
GroupAdd, Slack, ahk_exe Slack.exe
GroupAdd, Discord, ahk_exe Discord.exe
GroupAdd, VSCode, ahk_exe Code.exe
GroupAdd, Email, ahk_exe MailClient.exe

open_or_switch_to(exe_name, application_path, group_name)
{
  IfWinExist, ahk_exe %exe_name%
    GroupActivate, %group_name%, R
  else
    Run, %application_path%
  Return
}

BrowserExe := "msedge.exe"
BrowserStart := "C:\Program Files (x86)\Microsoft\Edge Beta\Application\msedge.exe --profile-directory=Default"
BrowserGroup := "Browser"

VSCodeExe := "Code.exe"
VSCodeStart := "C:\Users\ricka\AppData\Local\Programs\Microsoft VS Code\Code.exe --new-window"
VSCodeGroup := "VSCode"

SlackStart := "C:\Users\ricka\AppData\Local\slack\slack.exe"
SlackExe := "Slack.exe"
SlackGroup := "Slack"

DiscordStart := "C:\Users\ricka\AppData\Local\Discord\Update.exe --processStart Discord.exe"
DiscordExe := "Discord.exe"
DiscordGroup := "Discord"

EmailStart := "C:\Program Files (x86)\eM Client\MailClient.exe"
EmailExe := "MailClient.exe"
EmailGroup := "Email"

>!1:: open_or_switch_to(BrowserExe, BrowserStart, BrowserGroup)
>!2:: open_or_switch_to(VSCodeExe, VSCodeStart, VSCodeGroup)
>!3:: GroupActivate, Terminal, R
>!4:: open_or_switch_to(SlackExe, SlackStart, SlackGroup)
>!5:: open_or_switch_to(DiscordExe, DiscordStart, DiscordGroup)
>!6:: open_or_switch_to(EmailExe, EmailStart, EmailGroup)
>!h:: Send, {^}{Space}
>!F12:: Reload

^!1:: open_or_switch_to(BrowserExe, BrowserStart, BrowserGroup)
^!2:: open_or_switch_to(VSCodeExe, VSCodeStart, VSCodeGroup)
^!3:: GroupActivate, Terminal, R
^!4:: open_or_switch_to(SlackExe, SlackStart, SlackGroup)
^!5:: open_or_switch_to(DiscordExe, DiscordStart, DiscordGroup)
^!6:: open_or_switch_to(EmailExe, EmailStart, EmailGroup)
^!h:: Send, {^}{Space}
^!F12:: Reload

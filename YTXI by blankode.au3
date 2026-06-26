#cs ----------------------------------------------------------------------------

  AutoIt Version: 3.3.12.0
   Author:         blankode

	 Script Function:
     youtube-dl pokayoke v2 using yt-dlp

	Prerequisites:
	winget install DenoLand.Deno

#ce ----------------------------------------------------------------------------
#include <AutoItConstants.au3>
#include <InetConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>
$x = @DesktopWidth / 2.5
HotKeySet("{1}", "downloadmp3")
HotKeySet("{2}", "downloadmp4")
HotKeySet("{3}", "downloadhqmp4")
HotKeySet("{F8}", "hidegui")
HotKeySet("{F9}", "update")
HotKeySet("{F10}", "terminate")
ToolTip("1 - MP3 | 2 - MP4 | 3 - HQMP4 | F8 - ON/OFF GUI | F9 - UPDATE | F10 - EXIT", $x, 0)

$go = 1

While 1
    If $go = 1 Then
    ;ToolTip("paused", $x, 0)
    EndIf
WEnd

Func hidegui()
    $go = $go * -1 + 1
	If $go = 0 then
	ToolTip("", $x, 0)
   ElseIf $go = 1 Then
   ToolTip("1 - MP3 | 2 - MP4 | 3 - HQMP4 | F8 - ON/OFF GUI | F9 - UPDATE | F10 - EXIT", $x, 0)
	endif
 EndFunc

Func downloadmp3()
   Send("!d")
   Sleep(100)
   Send("^c")
   Sleep(100)

   Local $url = ClipGet()
   Local $out = '"' & @DesktopDir & '\MP3\%(title)s.%(ext)s"'

   DirCreate(@DesktopDir & "\MP3")

   Local $cmd = '"' & @ScriptDir & '\yt-dlp.exe" ' & _
      '--windows-filenames --no-playlist --remote-components ejs:github ' & _
      '-o ' & $out & ' -i --extract-audio --audio-format mp3 --audio-quality 0 "' & $url & '"'

   Run($cmd, @ScriptDir)
EndFunc


Func downloadmp4()
   Send("!d")
   Sleep(100)
   Send("^c")
   Sleep(100)

   Local $url = ClipGet()
   Local $out = '"' & @DesktopDir & '\MP4\%(title)s.%(ext)s"'

   DirCreate(@DesktopDir & "\MP4")

   Local $cmd = '"' & @ScriptDir & '\yt-dlp.exe" ' & _
      '--windows-filenames --no-playlist --remote-components ejs:github ' & _
      '-o ' & $out & ' -i -f "bv*[height<=480]+ba/b[height<=480]/b" --merge-output-format mp4 "' & $url & '"'

   Run($cmd, @ScriptDir)
EndFunc


Func downloadhqmp4()
   Send("!d")
   Sleep(100)
   Send("^c")
   Sleep(100)

   Local $url = ClipGet()
   Local $out = '"' & @DesktopDir & '\HQMP4\%(title)s.%(ext)s"'

   DirCreate(@DesktopDir & "\HQMP4")

   Local $cmd = '"' & @ScriptDir & '\yt-dlp.exe" ' & _
      '--windows-filenames --no-playlist --remote-components ejs:github ' & _
      '-o ' & $out & ' -i -f "bv*+ba/b" --merge-output-format mp4 "' & $url & '"'

   Run($cmd, @ScriptDir)
EndFunc

Func update()
   ToolTip("Do not use the program! I'm updating!", $x, 0)

   Local $sFilePath = @ScriptDir & "\yt-dlp.exe"
   InetGet("https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe", $sFilePath, $INET_FORCERELOAD)

   ToolTip("Program updated succesfully!", $x, 0)
   Sleep(3000)
   ToolTip("1 - MP3 | 2 - MP4 | 3 - HQMP4 | F8 - ON/OFF GUI | F9 - UPDATE | F10 - EXIT", $x, 0)
EndFunc

Func terminate()
    Exit 0
EndFunc

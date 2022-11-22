#cs ----------------------------------------------------------------------------

  AutoIt Version: 3.3.12.0
   Author:         blankode

	 Script Function:
     youtube-dl pokayoke v2 using yt-dlp

#ce ----------------------------------------------------------------------------
#include <AutoItConstants.au3>
#include <InetConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>
$x = @DesktopWidth / 2.5
HotKeySet("{1}", "downloadmp3")
HotKeySet("{2}", "downloadmp4")
HotKeySet("{2}", "downloadhqmp4")
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
   send ("!d")
   send ("^c")
   $url = ClipGet()
   Run("yt-dlp.exe"&" -o C:/%HOMEPATH%/Desktop/MP3/%(title)s.%(ext)s -i --extract-audio --audio-format mp3 --audio-quality 0 " & $url)
EndFunc

Func downloadmp4()
   send ("!d")
   send ("^c")
   $url = ClipGet()
   Run("yt-dlp.exe"&" -o C:/%HOMEPATH%/Desktop/MP4/%(title)s.%(ext)s -i -f bestvideo[height<=480]+bestaudio/best[height<=480] " & $url)
EndFunc

Func downloadhqmp4()
   send ("!d")
   send ("^c")
   $url = ClipGet()
   Run("yt-dlp.exe"&" -o C:/%HOMEPATH%/Desktop/HQMP4/%(title)s.%(ext)s -i -f bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4 " & $url)
EndFunc

Func update()
   ToolTip("Do not use the program! I'm updating!", $x, 0)
	; Save the downloaded file to the temporary folder.
    Local $sFilePath = "yt-dlp.exe"
    ; Download the file by waiting for it to complete. The option of 'get the file from the local cache' has been selected.
    Local $iBytesSize = InetGet("https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe", $sFilePath, $INET_FORCERELOAD)
   ToolTip("Program updated succesfully!", $x, 0)
   Sleep(3000)
   ToolTip("1 - MP3 | 2 - MP4 | 3 - HQMP4 | F8 - ON/OFF GUI | F9 - UPDATE | F10 - EXIT", $x, 0)
EndFunc

Func terminate()
    Exit 0
EndFunc

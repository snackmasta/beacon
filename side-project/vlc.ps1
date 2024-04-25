# Specify the paths to VLC and the video file
$vlcPath = "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe"
$videoPath = "E:\Animu\Sousou-01-720p-Btsite.mkv"

# Start VLC with the specified video in fullscreen mode
Start-Process -FilePath $vlcPath -ArgumentList "--fullscreen", $videoPath

# Specify the paths to VLC and the video file
$vlcPath = "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe"
$videoPath = "C:\Users\Legion\Videos\Sousou-18-720p-Btsite.mkv"

# Start VLC with the specified video in fullscreen mode
Start-Process -FilePath $vlcPath -ArgumentList "--fullscreen", $videoPath

Add-Type @"
    using System;
    using System.Text;
    using System.Runtime.InteropServices;

    public class User32 {
        [DllImport("user32.dll")]
        [return: MarshalAs(UnmanagedType.Bool)]
        public static extern bool GetForegroundWindow();

        [DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)]
        public static extern int GetWindowText(IntPtr hWnd, StringBuilder lpString, int nMaxCount);
    }
"@

function Get-ActiveWindowTitle {
    $handle = [System.Windows.Forms.SystemInformation]::ForegroundWindowHandle
    $titleBuilder = New-Object StringBuilder 512
    [User32]::GetWindowText($handle, $titleBuilder, $titleBuilder.Capacity) | Out-Null
    $titleBuilder.ToString().Trim()
}

# Usage
$activeWindowTitle = Get-ActiveWindowTitle
Write-Host "Active Window Title: $activeWindowTitle"

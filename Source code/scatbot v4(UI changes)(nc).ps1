Add-Type -AssemblyName WindowsBase
Add-Type -AssemblyName PresentationCore

Write-Host 'Make sure this window overlaps the textbox you want to spam'
$userInput = Read-Host -Prompt 'Specify Number of Times'
Write-Host 'Check:'$userInput
Write-Host 'To ABORT, press either SHIFT button'

$name = Get-Process | where {$_.MainWindowTitle -like "*chrome*"} | Select-Object MainWindowTitle
$nameValue = $name.MainWindowTitle

$wshell = New-Object -ComObject wscript.shell;
$wshell.AppActivate($nameValue)



for($r = 0; $r -lt $userInput; $r = $r + 1){
Start-Sleep -Seconds 2
$isDown = [Windows.Input.Keyboard]::IsKeyDown([System.Windows.Input.Key]::RightShift)
$isDownLeft = [Windows.Input.Keyboard]::IsKeyDown([System.Windows.Input.Key]::LeftShift)

if($isDown){
Write-Warning "ABORTED!!!"
break
}
elseif($isDownLeft){
Write-Warning "ABORTED!!!"
break
}
else{
$scatLink = (Invoke-WebRequest -Uri rate-my-poop.com).Images.src
$wshell.SendKeys($scatLink + '{ENTER}')
}

}

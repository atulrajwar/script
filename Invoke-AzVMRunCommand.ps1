#Connect-AzAccount

#Invoke-AzVMRunCommand -ResourceGroupName 'rgname' -VMName 'vmname' -CommandId 'RunPowerShellScript' -ScriptPath 'sample.ps1' -Parameter @{param1 = "var1"; param2 = "var2"}
Invoke-AzVMRunCommand -ResourceGroupName company9 -VMName SimpleWinVM -CommandId "RunPowerShellScript" -ScriptPath E:\work\sample.ps1 -Parameter @{param1 = "c:\"; param2 = "bb.txt"; param3 = "I am great"}
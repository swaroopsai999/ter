$Conn = Get-AutomationConnection -Name AzureRunAsConnection
Add-AzureRMAccount -ServicePrincipal -Tenant $Conn.TenantID -ApplicationId $Conn.ApplicationID -CertificateThumbprint $Conn.CertificateThumbprint
$VMs = Get-AzureRMVM | where {$_.Tags.Values -like '*Include*'}
$VMs | Stop-AzureRMVM -force
Write-Output $VMs.Name

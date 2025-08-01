# PowerShell script to create a department site
# Requires: Connect-PnPOnline -Interactive

$params = @{Title = 'Department Site'; Url = 'https://diatonicvisuals.sharepoint.com/sites/department'; Template = 'STS#3'}
New-PnPSite @params -Lcid 1033 -Owner 'admin@diatonic.online' -TimeZone 13
Apply-PnPTenantTemplate -Path './templates/dept-site.xml'

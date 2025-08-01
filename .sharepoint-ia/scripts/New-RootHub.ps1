# PowerShell script to create the root hub
# Requires: Connect-PnPOnline -Interactive

$params = @{Title = 'Diatonic Visuals HQ'; Url = 'https://dv.sharepoint.com'; SiteDesign = 'SITEPAGEPUBLISHING#0'}
New-PnPSite @params -Lcid 1033 -Owner 'admin@dv.com' -TimeZone 13
Register-PnPHubSite -Site 'https://dv.sharepoint.com' -Title 'Diatonic Visuals Hub'
Apply-PnPTenantTemplate -Path './templates/root-hub.xml'

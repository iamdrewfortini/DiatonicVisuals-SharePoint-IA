# PowerShell script to create the root hub
# Requires: Connect-PnPOnline -Interactive

$params = @{Title = 'Diatonic Visuals HQ'; Url = 'https://diatonicvisuals.sharepoint.com'; SiteDesign = 'SITEPAGEPUBLISHING#0'}
New-PnPSite @params -Lcid 1033 -Owner 'admin@diatonic.online' -TimeZone 13
Register-PnPHubSite -Site 'https://diatonicvisuals.sharepoint.com' -Title 'Diatonic Visuals Hub'
Apply-PnPTenantTemplate -Path './templates/root-hub.xml'

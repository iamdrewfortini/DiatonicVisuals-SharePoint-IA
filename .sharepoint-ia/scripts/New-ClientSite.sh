#!/bin/bash
# Script to create a client site

m365 spo site add \
  --type CommunicationSite \
  --title "$1 Portal" \
  --url "https://diatonicvisuals.sharepoint.com/sites/$1" \
  --owners "admin@diatonic.online" && \
m365 spo hubsite connect --siteUrl "https://diatonicvisuals.sharepoint.com/sites/$1" --hubSiteId $CLIENTS_HUB_ID && \
m365 spo site classic set --url "https://diatonicvisuals.sharepoint.com/sites/$1" --sharing ExternallyAuthenticated && \
m365 spo fs add --webUrl "https://diatonicvisuals.sharepoint.com/sites/$1" --path templates/client-site.xml

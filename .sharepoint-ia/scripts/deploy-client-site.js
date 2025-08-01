#!/usr/bin/env node

/**
 * Deploy Client Site using CLI for Microsoft 365
 * Cross-platform deployment script
 */

const { execSync } = require('child_process');
const path = require('path');

// Get client name from command line arguments
const clientName = process.argv[2];
if (!clientName) {
  console.error('❌ Please provide a client name: node deploy-client-site.js "ClientName"');
  process.exit(1);
}

const config = {
  clientName: clientName,
  title: `${clientName} Portal`,
  url: `https://dv.sharepoint.com/sites/${clientName.toLowerCase().replace(/\s+/g, '-')}`,
  owner: 'pm@dv.com',
  lcid: 1033,
  clientsHubId: process.env.CLIENTS_HUB_ID || ''
};

function executeCommand(command, description) {
  console.log(`\n🔄 ${description}...`);
  try {
    const result = execSync(command, { encoding: 'utf8', stdio: 'inherit' });
    console.log(`✅ ${description} completed successfully`);
    return result;
  } catch (error) {
    console.error(`❌ ${description} failed:`, error.message);
    throw error;
  }
}

async function deployClientSite() {
  try {
    console.log(`🚀 Starting Client Site deployment for: ${config.clientName}`);

    // Create communication site
    executeCommand(
      `m365 spo site add --type CommunicationSite --title "${config.title}" --url "${config.url}" --lcid ${config.lcid} --owners "${config.owner}"`,
      'Creating client site'
    );

    // Connect to clients hub if hub ID is provided
    if (config.clientsHubId) {
      executeCommand(
        `m365 spo hubsite connect --siteUrl "${config.url}" --hubSiteId "${config.clientsHubId}"`,
        'Connecting site to clients hub'
      );
    }

    // Set external sharing settings
    executeCommand(
      `m365 spo site set --url "${config.url}" --sharing ExternalUserAndGuestSharing`,
      'Configuring external sharing settings'
    );

    // Apply client site template
    const templatePath = path.join(__dirname, '../templates/client-site.xml');
    executeCommand(
      `m365 spo template apply --webUrl "${config.url}" --path "${templatePath}"`,
      'Applying client site template'
    );

    console.log('🎉 Client Site deployment completed successfully!');
    console.log(`📍 Access your site at: ${config.url}`);
    console.log(`👥 Client: ${config.clientName}`);

  } catch (error) {
    console.error('💥 Deployment failed:', error.message);
    process.exit(1);
  }
}

// Run deployment
deployClientSite();

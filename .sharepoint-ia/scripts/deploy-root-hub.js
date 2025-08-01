#!/usr/bin/env node

/**
 * Deploy Root Hub using CLI for Microsoft 365
 * Cross-platform deployment script
 */

const { execSync } = require('child_process');
const path = require('path');

const config = {
  title: 'Diatonic Visuals HQ',
  url: 'https://diatonicvisuals.sharepoint.com',
  template: 'SITEPAGEPUBLISHING#0',
  owner: 'admin@diatonic.online',
  lcid: 1033,
  timeZone: 13
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

async function deployRootHub() {
  try {
    console.log('🚀 Starting Root Hub deployment...');

    // Check if site already exists
    try {
      executeCommand(
        `m365 spo site get --url "${config.url}"`,
        'Checking if site already exists'
      );
      console.log('⚠️ Site already exists, skipping creation');
    } catch (error) {
      // Site doesn't exist, create it
      executeCommand(
        `m365 spo site add --type CommunicationSite --title "${config.title}" --url "${config.url}" --lcid ${config.lcid} --owners "${config.owner}"`,
        'Creating root hub site'
      );
    }

    // Register as hub site
    try {
      executeCommand(
        `m365 spo hubsite register --siteUrl "${config.url}" --title "Diatonic Visuals Hub"`,
        'Registering hub site'
      );
    } catch (error) {
      console.log('⚠️ Hub site might already be registered');
    }

    // Apply template
    const templatePath = path.join(__dirname, '../templates/root-hub.xml');
    executeCommand(
      `m365 spo template apply --webUrl "${config.url}" --path "${templatePath}"`,
      'Applying root hub template'
    );

    console.log('🎉 Root Hub deployment completed successfully!');
    console.log(`📍 Access your site at: ${config.url}`);

  } catch (error) {
    console.error('💥 Deployment failed:', error.message);
    process.exit(1);
  }
}

// Run deployment
deployRootHub();

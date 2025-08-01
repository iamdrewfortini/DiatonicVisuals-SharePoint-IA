#!/usr/bin/env node

/**
 * Test Microsoft 365 authentication
 */

const { execSync } = require('child_process');

function testAuth() {
  console.log('🔐 Testing Microsoft 365 authentication...');
  
  try {
    const result = execSync('m365 status', { encoding: 'utf8' });
    console.log('✅ Authentication successful!');
    console.log(result);
  } catch (error) {
    console.log('❌ Not authenticated. Please run: m365 login');
    console.log('💡 For automated scenarios, use: m365 login --authType deviceCode');
  }
}

testAuth();

# Diatonic Visuals – SharePoint Information Architecture

[![SPFx Version](https://img.shields.io/badge/SPFx-1.21.1-green.svg)](https://docs.microsoft.com/en-us/sharepoint/dev/spfx/set-up-your-developer-tenant)
[![Node.js Version](https://img.shields.io/badge/Node.js-22.x-green.svg)](https://nodejs.org/)
[![Build Status](https://github.com/iamdrewfortini/DiatonicVisuals-SharePoint-IA/workflows/CI%2FCD/badge.svg)](https://github.com/iamdrewfortini/DiatonicVisuals-SharePoint-IA/actions)

## 🎯 Overview

Comprehensive SharePoint Online Information Architecture solution for Diatonic Visuals, featuring automated site provisioning, custom SPFx components, and CI/CD workflows.

### Strategic Objectives

- **Single Digital HQ**: Centralized hub for staff and client navigation
- **Departmental Autonomy + Consistency**: Department-specific sites with unified branding
- **Client Enablement Portals**: Dedicated client project spaces with B2B guest access
- **Everything-as-Code**: Automated provisioning with PnP templates and GitHub workflows

## 🏗️ Architecture

```
Root Hub (https://dv.sharepoint.com)
├─ Home (Communication Site)  ← global news, navigation, KPIs
├─ Internal Sites (Hub‑Associated)
│   ├─ Marketing            (Team Site)
│   ├─ Visual Media         (Team Site)
│   ├─ Technology           (Team Site)
│   └─ Managed Services     (Team Site)
└─ Client Portals (Hub‑Associated via separate hub "Clients")
    ├─ Client‑ABC           (Communication Site)
    ├─ Client‑XYZ           (Communication Site)
    └─ <provision‑on‑demand>
```

## 🚀 Quick Start

### Prerequisites

- Node.js 22.x
- SharePoint Framework development environment
- Microsoft 365 tenant with admin access
- GitHub CLI (for repository management)

### Installation

```bash
# Clone the repository
git clone https://github.com/iamdrewfortini/DiatonicVisuals-SharePoint-IA.git
cd DiatonicVisuals-SharePoint-IA

# Install dependencies
npm install

# Setup SharePoint IA automation
npm run ia:setup
```

### Local Development

```bash
# Build SPFx solution
npm run build

# Serve locally
gulp serve

# Package for deployment
gulp bundle --ship
gulp package-solution --ship
```

## 📦 SharePoint IA Automation

### Available Commands

```bash
# Create root hub site
npm run ia:create-root-hub

# Create department sites
npm run ia:create-dept-site

# Create client site (requires client name parameter)
npm run ia:create-client-site

# Deploy all sites
npm run ia:deploy-all

# Validate templates
npm run ia:validate
```

### Manual Site Creation

```bash
# Create a specific client site
cd .sharepoint-ia
bash ./scripts/New-ClientSite.sh "ClientName"
```

## 🔧 Configuration

### Environment Variables

Create a `.env` file in the `.sharepoint-ia` directory:

```env
CLIENTS_HUB_ID=your-clients-hub-id
TENANT_URL=https://yourtenant.sharepoint.com
ROOT_HUB_URL=https://yourtenant.sharepoint.com
APPCATALOG_URL=https://yourtenant.sharepoint.com/sites/AppCatalog
```

### GitHub Secrets

Configure the following secrets in your GitHub repository:

- `M365_USERNAME`: Microsoft 365 admin username
- `M365_PASSWORD`: Microsoft 365 admin password
- `APPCATALOG_URL`: SharePoint App Catalog URL
- `ROOT_HUB_URL`: Root Hub site URL
- `CLIENTS_HUB_ID`: Clients Hub site ID

## 🔄 CI/CD Workflows

### Automated Workflows

1. **CI/CD** (`ci-cd.yml`): Builds and tests on every push
2. **SharePoint Provisioning** (`sharepoint-provisioning.yml`): Manual site deployment
3. **SPFx Build and Deploy** (`spfx-build-deploy.yml`): Automated SPFx deployment

### Manual Deployment

Use GitHub Actions manual workflow dispatch:

1. Go to Actions tab in GitHub
2. Select "SharePoint Site Provisioning"
3. Click "Run workflow"
4. Choose deployment type and parameters

## 📁 Project Structure

```
├── .github/workflows/          # GitHub Actions workflows
├── .sharepoint-ia/            # SharePoint IA automation
│   ├── templates/             # PnP provisioning templates
│   ├── scripts/              # PowerShell and Bash scripts
│   └── package.json          # IA automation dependencies
├── src/                      # SPFx source code
├── config/                   # SPFx configuration
├── sharepoint/solution/      # Generated SPFx packages
└── scripts/                  # Build utilities
```

## 🎨 Features

### SPFx Components

- **Global Header**: Mega-menu navigation component
- **Client Portal Web Parts**: Project status and deliverable tracking
- **Department Dashboards**: KPI and metrics visualization

### SharePoint Templates

- **Root Hub**: Communication site with global navigation
- **Department Sites**: Team sites with Planner and OneNote integration
- **Client Portals**: Communication sites with external sharing

### Automation Features

- One-command site provisioning
- Automated content type deployment
- Security and governance enforcement
- CI/CD integration with GitHub Actions

## 🔒 Security & Governance

| Layer | Policy |
|-------|--------|
| **Site Creation** | Provisioning scripts only |
| **Sensitivity Labels** | Public (root), Internal-Confidential (internal), Client-Restricted (portals) |
| **Guest Access** | Client portals only |
| **Retention** | 7 years (internal), 3 years (client), 2 years (media) |
| **Audit** | Monthly compliance review |

## 🚀 Future Enhancements

- [ ] Viva Connections dashboard integration
- [ ] Power Platform workflow automation
- [ ] Microsoft Learning Pathways integration
- [ ] AI Copilot extensions with Azure OpenAI
- [ ] Advanced analytics and reporting

## 📚 Resources

- [SharePoint Framework Documentation](https://docs.microsoft.com/en-us/sharepoint/dev/spfx/)
- [PnP PowerShell Documentation](https://pnp.github.io/powershell/)
- [CLI for Microsoft 365](https://pnp.github.io/cli-microsoft365/)
- [Microsoft 365 Patterns and Practices](https://aka.ms/m365pnp)

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Contributing

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📞 Support

For support and questions, please [open an issue](https://github.com/iamdrewfortini/DiatonicVisuals-SharePoint-IA/issues) in this repository.

---

**Prepared for Diatonic Visuals – All rights reserved.**

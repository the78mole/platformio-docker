# 📋 Template Usage Instructions

This repository is a **GitHub Template** for creating PlatformIO Docker development environments.

## 🚀 Quick Setup

### 1. Use This Template
Click the **"Use this template"** button on GitHub to create a new repository from this template.

### 2. Clone Your New Repository
```bash
git clone https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
cd YOUR_REPO_NAME
```

### 3. Run Template Setup
```bash
./setup-template.sh
```

This script will:
- ✅ Replace template placeholders with your repository information
- ✅ Update README.md with correct URLs and image references  
- ✅ Configure DevContainer settings
- ✅ Update any other template files

### 4. Customize (Optional)
- **Dockerfile**: Modify tool versions or add additional packages
- **README.md**: Add project-specific information
- **GitHub Workflows**: Adjust CI/CD settings if needed

### 5. Commit and Push
```bash
git add .
git commit -m "feat: initial setup from template"
git push origin main
```

### 6. Create First Release
Create a release on GitHub to trigger the first Docker image build:
```bash
git tag v1.0.0
git push origin v1.0.0
```

## 🔧 What Gets Automated

### ✅ Automatic Docker Builds
- **Pull Requests**: Build check without pushing
- **Main Branch**: Build and push to `ghcr.io/YOUR_USERNAME/YOUR_REPO_NAME:latest`
- **Releases**: Build and push tagged versions

### ✅ Dependency Updates
- **Renovate Bot**: Automatically creates PRs for dependency updates
- **Version Pinning**: Ensures reproducible builds
- **Automated Testing**: Pre-commit hooks validate changes

### ✅ VS Code Integration
- **DevContainer**: Ready-to-use development environment
- **Extensions**: Pre-configured PlatformIO IDE setup
- **Hardware Access**: USB device support included

## 📦 Template Structure

```
├── .devcontainer/
│   └── devcontainer.json          # VS Code DevContainer configuration
├── .github/
│   └── workflows/
│       ├── build-check.yml        # PR build validation
│       ├── release.yml             # Release automation
│       └── test-precommit.yml      # Code quality checks
├── scripts/
│   └── delete-workflow-runs.sh    # Utility script
├── test-project/                   # Example PlatformIO project
│   ├── platformio.ini
│   ├── src/main.cpp
│   └── .gitignore
├── Dockerfile                      # Main Docker image definition
├── renovate.json                   # Dependency update configuration
├── README.template.md              # Template README (gets processed)
├── setup-template.sh               # This setup script
└── TEMPLATE.md                     # This file
```

## 🎯 Template Features

- **🏗️ Production-Ready**: Optimized Docker layers and pinned versions
- **🔄 Auto-Updates**: Renovate bot manages dependencies
- **🚀 CI/CD Ready**: GitHub Actions for building and releasing
- **👥 Multi-User**: Works with any GitHub username/repository
- **📱 Hardware Support**: USB device access for embedded development
- **🧪 Testing**: Pre-commit hooks and automated validation

## 🛠️ Customization Options

### Adding New Tools
Edit the `Dockerfile` to include additional development tools:
```dockerfile
# Add your custom tools
RUN apt-get update && apt-get install -y \
    your-tool-here \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Add Python packages
RUN pip3 install --break-system-packages \
    your-python-package==1.0.0
```

### Modifying Renovate Configuration
Edit `renovate.json` to customize dependency update behavior:
```json
{
  "schedule": ["before 6am on sunday"],
  "prHourlyLimit": 1,
  "groupName": "My Custom Group"
}
```

### Custom GitHub Actions
Add your own workflows in `.github/workflows/` for:
- Custom testing scenarios
- Additional deployment targets
- Integration with other services

## 📄 License

This template is provided under the MIT License. Your derived repositories can use any license you choose.

---

**Happy Coding!** 🚀 Start building your PlatformIO Docker environment!

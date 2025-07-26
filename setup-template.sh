#!/bin/bash

# Template setup script for PlatformIO Docker Template
# This script replaces template placeholders with actual repository information

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🧰 PlatformIO Docker Template Setup${NC}"
echo "This script will customize the template for your repository."
echo

# Get repository information
if [ -d ".git" ]; then
    # Try to get from git remote
    REPO_URL=$(git remote get-url origin 2>/dev/null || echo "")
    if [[ $REPO_URL =~ github\.com[:/]([^/]+)/([^/.]+) ]]; then
        DEFAULT_USERNAME="${BASH_REMATCH[1]}"
        DEFAULT_REPO_NAME="${BASH_REMATCH[2]}"
    else
        DEFAULT_USERNAME=""
        DEFAULT_REPO_NAME=""
    fi
else
    DEFAULT_USERNAME=""
    DEFAULT_REPO_NAME=""
fi

# Get username
echo -e "${YELLOW}GitHub Username:${NC}"
if [ -n "$DEFAULT_USERNAME" ]; then
    read -p "Enter your GitHub username [$DEFAULT_USERNAME]: " USERNAME
    USERNAME=${USERNAME:-$DEFAULT_USERNAME}
else
    read -p "Enter your GitHub username: " USERNAME
fi

# Get repository name
echo -e "${YELLOW}Repository Name:${NC}"
if [ -n "$DEFAULT_REPO_NAME" ]; then
    read -p "Enter your repository name [$DEFAULT_REPO_NAME]: " REPO_NAME
    REPO_NAME=${REPO_NAME:-$DEFAULT_REPO_NAME}
else
    read -p "Enter your repository name: " REPO_NAME
fi

# Validate inputs
if [ -z "$USERNAME" ] || [ -z "$REPO_NAME" ]; then
    echo -e "${RED}❌ Username and repository name are required!${NC}"
    exit 1
fi

echo
echo -e "${BLUE}Setting up template with:${NC}"
echo -e "  Username: ${GREEN}$USERNAME${NC}"
echo -e "  Repository: ${GREEN}$REPO_NAME${NC}"
echo

# Replace placeholders in README
if [ -f "README.template.md" ]; then
    echo -e "${YELLOW}📝 Updating README.md...${NC}"
    sed "s/YOUR_USERNAME/$USERNAME/g; s/YOUR_REPO_NAME/$REPO_NAME/g" README.template.md > README.md
    echo -e "${GREEN}✅ README.md updated${NC}"
else
    echo -e "${YELLOW}⚠️  README.template.md not found, skipping README update${NC}"
fi

# Update devcontainer example if it exists
if [ -f ".devcontainer/devcontainer.json" ]; then
    echo -e "${YELLOW}📝 Updating .devcontainer/devcontainer.json...${NC}"
    sed -i "s/YOUR_USERNAME/$USERNAME/g; s/YOUR_REPO_NAME/$REPO_NAME/g" .devcontainer/devcontainer.json
    echo -e "${GREEN}✅ DevContainer configuration updated${NC}"
fi

# Update any other template files
find . -name "*.template" -o -name "*.example" | while read -r file; do
    if [ -f "$file" ]; then
        echo -e "${YELLOW}📝 Processing $file...${NC}"
        output_file="${file%.template}"
        output_file="${output_file%.example}"
        sed "s/YOUR_USERNAME/$USERNAME/g; s/YOUR_REPO_NAME/$REPO_NAME/g" "$file" > "$output_file"
        echo -e "${GREEN}✅ $output_file updated${NC}"
    fi
done

echo
echo -e "${GREEN}🎉 Template setup complete!${NC}"
echo
echo -e "${BLUE}Next steps:${NC}"
echo -e "1. Review and customize the ${GREEN}README.md${NC}"
echo -e "2. Update the ${GREEN}Dockerfile${NC} if needed"
echo -e "3. Commit and push your changes"
echo -e "4. Create a release to trigger the Docker image build"
echo
echo -e "${YELLOW}💡 Tip:${NC} You can safely delete ${YELLOW}README.template.md${NC} and ${YELLOW}setup-template.sh${NC} after setup"

#!/bin/bash
# Copyright (c) Syncfusion Inc. All rights reserved.


# Set the repository URL, branch name, and directory paths
REPO_URL="https://github.com/boldbi/boldbi-linux.git"
BRANCH_NAME="KC282151"
REPO_NAME="boldbi-linux"
CHECKOUT_DIR=""
user=""
host_url=""

ubuntu_prerequisites() {
sudo apt-get update

# Install packages
sudo apt-get install -y zip nginx libgdiplus pv

export OPENSSL_CONF=/etc/ssl/
return 0
}

centos_prerequisites() {

# Install packages
sudo yum update -y
sudo yum install -y zip
sudo yum install -y epel-release
sudo yum install -y libgdiplus
sudo yum install -y nginx
sudo yum install -y pv
export OPENSSL_CONF=/etc/ssl/
return 0
}

check_distribution() {
if [ -f /etc/lsb-release ]; then
    echo "Distribution is Ubuntu"
    # Execute Ubuntu-specific command here
    ubuntu_prerequisites

# Check if the distribution is CentOS 
elif [ -f /etc/centos-release ]; then
    echo "Distribution is CentOS"
    # Execute CentOS-specific command here
    centos_prerequisites
else
    echo "Distribution not recognized"
    exit 1
fi
}
install_boldbi() {
        cd "$CHECKOUT_DIR/$REPO_NAME"
        if [ -d "/var/www/bold-services" ]; then
                sudo bash install-boldbi.sh -i upgrade -u $user
                return 0
        else
                check_distribution
                sudo bash install-boldbi.sh -i new -u $user -h $host_url -n true
                return 0
       fi
}
git_clone() {
# Change to the checkout directory
cd "$CHECKOUT_DIR"

# Check if the repository directory exists
if [ -d "$REPO_NAME" ]; then
  # If the directory exists, change to it and pull changes from the same branch
  cd "$REPO_NAME"
  git fetch origin "$BRANCH_NAME"
  if [ "$(git rev-parse HEAD)" != "$(git rev-parse "@{u}")" ]; then
    git pull origin "$BRANCH_NAME"
    install_boldbi
  fi
else
  # If the directory does not exist, clone the repository
  git clone -b "$BRANCH_NAME" "$REPO_URL" "$REPO_NAME"
  install_boldbi
fi
}
git_clone

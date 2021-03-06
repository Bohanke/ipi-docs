#!/bin/bash
# Decrypt the private key
openssl aes-256-cbc -K $encrypted_ebeecafcf619_key -iv $encrypted_ebeecafcf619_iv -in .travis/ssh_key.enc -out ~/.ssh/id_rsa -d
# Set the permission of the key
chmod 600 ~/.ssh/id_rsa
# Start SSH agent
eval $(ssh-agent)
# Add the private key to the system
ssh-add ~/.ssh/id_rsa
# Copy SSH config
cp .travis/ssh_config ~/.ssh/config
# Set Git config
git config --global user.name "Ryan Huang"
git config --global user.email ryanzj.huang@adlinktech.com
# Clone the repository
git clone git@github.com:ADLINK-EPM/ipiwiki-page.git .deploy_git
# Deploy to GitHub
npm run deploy

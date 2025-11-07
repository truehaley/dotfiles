#!/usr/bin/env bash

cd ~

echo Installing command line tools
xcode-select --install

echo Installing Rosetta
softwareupdate --install-rosetta --agree-to-license

mkdir -p ~/bin
mkdir -p ~/projects

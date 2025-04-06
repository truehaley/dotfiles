#!/usr/bin/env bash

echo Installing command line tools
xcode-select --install

echo Installing Rosetta
softwareupdate --install-rosetta --agree-to-license

mkdir -p ~/bin

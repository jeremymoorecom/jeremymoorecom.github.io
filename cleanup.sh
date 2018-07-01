#!/bin/bash
echo "removing ._*"
sudo find . -name "._*" -exec rm -fr {} \;
echo "Done"
echo "removing .DS_Store"
sudo find . -name ".DS_Store" -exec rm -fr {} \;
echo "Done"

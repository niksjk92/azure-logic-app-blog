#!/bin/sh
cp pre-commit.template ./.git/hooks/pre-commit

chmod +x ./.git/hooks/pre-commit

echo "Pre-commit hooks installed and authorized for git"

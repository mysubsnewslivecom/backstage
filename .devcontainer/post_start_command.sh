#!/bin/bash
yarn install
export VIRTUAL_ENV=$HOME/venv
python3 -m venv $VIRTUAL_ENV
export PATH="$VIRTUAL_ENV/bin:$PATH"
python3 -m pip install mkdocs-techdocs-core

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

bash -c -l 'nvm install 20'

 npm install semantic-release \
    @semantic-release/gitlab \
    @semantic-release/github \
    @semantic-release/changelog \
    @semantic-release/git \
    @semantic-release/exec \
    @semantic-release/commit-analyzer \
    conventional-changelog-conventionalcommits \
    @semantic-release/gitlab

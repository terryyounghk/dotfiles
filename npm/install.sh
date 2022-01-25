#!/bin/sh

# routine
[ ! -f script/helper ] && echo "Please run this from $HOME/.dotfiles" && exit 1
. script/helper

set -e

#if test ! $(which spoof)
#then
#  sudo npm install spoof -g
#fi

# TODO: @nestjs/cli

npm install -g \
    babel-cli \
    babel-eslint \
    depcheck \
    eslint \
    @typescript-eslint/eslint-plugin \
    @typescript-eslint/eslint-plugin-tslint \
    @typescript-eslint/parser \
    eslint-config-prettier \
    eslint-plugin-import \
    eslint-plugin-jsdoc \
    eslint-plugin-prefer-arrow \
    eslint-config-airbnb \
    eslint-config-standard \
    eslint-plugin-babel \
    eslint-plugin-html \
    eslint-plugin-import \
    eslint-plugin-jsx-a11y \
    eslint-plugin-node \
    eslint-plugin-promise \
    eslint-plugin-react-hooks \
    eslint-plugin-react \
    eslint-plugin-standard \
    express-generator \
    generator-webapp \
    js-beautify \
    jsonlint \
    lodash \
    mocha \
    serverless \
    sequelize-cli \
    ts-node \
    typescript \
    uglify-js \
    wscat \
    yarn

# install yarn...
curl -o- -L https://yarnpkg.com/install.sh | bash

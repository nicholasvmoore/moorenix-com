#!/bin/bash

set -eo pipefail

npm install -g hexo-cli
npm install hexo-generator-json-content

hexo generate --deploy
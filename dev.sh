#!/usr/bin/env bash
set -e

MY_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd ${MY_DIR}

${MY_DIR}/setup.sh

if [[ ! -f ${MY_DIR}/.env ]] || [[ -z `cat ${MY_DIR}/.env | grep SECRET_KEY_BASE` ]]; then
  printf "SECRET_KEY_BASE=`bundle exec rake secret`\n" >> ${MY_DIR}/.env
fi

echo "Installing updated dependencies..."
bundle install
bundle exec foreman start -f Procfile.dev

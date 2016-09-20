#!/usr/bin/env bash
set -e

MY_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd ${MY_DIR}

if [[ -z `which ruby` ]]; then
  echo "Please ensure ruby is installed and on your path and try again."
  exit 1
fi

if [[ -z `which gem` ]]; then
  echo "Please ensure rubygems is installed and on your path and try again."
  exit 1
fi

if [[ -z `which bundle` ]]; then
  echo "Installing bundler..."
  gem install bundler -N &> /dev/null
fi

mkdir -p ${MY_DIR}/tmp &> /dev/null

echo "Installing dependencies..."
bundle install &> /dev/null

#!/usr/bin/env bash
# exit on error
set -o errexit
set -o pipefail

echo "past the set"
# Activate the Poetry virtual environment
#source "$(poetry env info --path)/bin/activate"

echo "past the source"
poetry --version
# Ensure the lock file is up-to-date
poetry lock

echo "past the lock"
# Install project dependencies
poetry install

echo "past the install"
# Collect static files and migrate the database
#python manage.py collectstatic --no-input
python manage.py migrate

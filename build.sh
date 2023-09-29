#!/usr/bin/env bash
# exit on error
set -o errexit
set -o pipefail

POETRY_VERSION="1.6.1"
curl -sSL https://install.python-poetry.org | POETRY_VERSION=$POETRY_VERSION python -
# Activate the Poetry virtual environment
source "$(poetry env info --path)/bin/activate"

# Ensure the lock file is up-to-date
poetry lock

# Install project dependencies
poetry install

# Collect static files and migrate the database
#python manage.py collectstatic --no-input
python manage.py migrate

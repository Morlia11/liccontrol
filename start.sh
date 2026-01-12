#!/bin/bash
set -e

export PYTHONPATH=/liccontrol-integrator-back-end/src

# Удалено автоматическое создание миграции
# echo "==== Checking for model changes and generating Alembic migrations ===="
# alembic revision --autogenerate -m "Auto migration" || true

echo "==== Applying Alembic migrations ===="
alembic upgrade head

echo "==== Starting backend ===="
uvicorn src.application.app:app --host 0.0.0.0 --port 8000 --reload

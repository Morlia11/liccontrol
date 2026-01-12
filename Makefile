install:
	poetry install

migrate:
	poetry run alembic upgrade head

run: install migrate
	poetry run app

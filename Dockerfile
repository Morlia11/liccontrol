FROM python:3.12

WORKDIR /liccontrol-integrator-back-end

RUN apt-get update && apt-get install -y make curl

RUN curl -sSL https://install.python-poetry.org | python3 -
ENV PATH="$PATH:/root/.local/bin"

RUN poetry config virtualenvs.create false

COPY . .

RUN poetry install

COPY start.sh /start.sh
RUN chmod +x /start.sh

ENV PYTHONPATH=./src


ENTRYPOINT ["bash", "/start.sh"]

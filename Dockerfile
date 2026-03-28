FROM python:3.14.3-slim

COPY --from=docker.io/astral/uv:latest /uv /uvx /bin/

WORKDIR /app

COPY ./hello-world /app/hello-world

WORKDIR /app/hello-world

RUN uv sync

CMD ["uv", "run", "main.py"]
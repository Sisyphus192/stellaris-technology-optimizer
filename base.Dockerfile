FROM python:3.9.4-slim
RUN apt-get update && apt-get install -y --no-install-recommends --yes neovim netcat

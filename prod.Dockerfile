FROM python:3.9.4-slim AS base

FROM base AS builder
COPY requirements.txt /requirements.txt
RUN pip install --disable-pip-version-check -r /requirements.txt

FROM builder AS tester

COPY . /app
WORKDIR /app
RUN pytest

FROM base AS runner
COPY --from=tester /usr/local/lib/python3.9/ /usr/local/lib/python3.9/
COPY --from=tester /app /app

WORKDIR /app

ENTRYPOINT ["python", "-m", "stellaris-technology-optimizer"]
USER 1001

LABEL name={NAME}
LABEL version={VERSION}
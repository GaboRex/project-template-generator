FROM python:3.11-slim
ARG OPENAI_KEY
ENV OPENAI_KEY=$OPENAI_KEY
ENV PORT 8000


COPY requirements.txt /
RUN pip install -r requirements.txt

RUN apt-get update \
    && apt-get install -y libgl1-mesa-glx libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

COPY ./src /src

CMD uvicorn src.main:app --host 0.0.0.0 --port ${PORT}
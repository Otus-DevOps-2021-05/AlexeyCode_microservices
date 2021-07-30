FROM python:3.6.0

WORKDIR /app
COPY . /app

RUN apt-get update -qq && \
    apt-get install -y build-essential && \
    pip install -r /app/requirements.txt && \
    rm -rf /var/lib/apt/lists/*

ENV POST_DATABASE_HOST post_db
ENV POST_DATABASE posts

ENTRYPOINT ["python3", "post_app.py"]

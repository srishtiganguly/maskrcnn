FROM python:3.7

RUN pip install --upgrade pip

RUN apt-get update

RUN apt-get install ffmpeg libsm6 libxext6  -y

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt --no-cache-dir

COPY . /app

ENTRYPOINT [ "python","app.py"]
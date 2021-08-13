FROM python:stretch

RUN mkdir /app
COPY ./main.py /app
COPY ./README.md /app
COPY ./requirements.txt /app

WORKDIR /app

RUN pip install --upgrade pip
RUN pip install -r requirements.txt


# ENTRYPOINT ["python", "app.py"]
ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]


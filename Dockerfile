FROM python:3.14

WORKDIR /app

COPY .  .

EXPOSE 80

RUN pip install -r requirements.txt

CMD ["python","run.py"]


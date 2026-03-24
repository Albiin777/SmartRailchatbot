FROM python:3.10

WORKDIR /app

COPY . .

RUN pip install -r requirements.txt

RUN chmod +x start.sh

EXPOSE 5005

CMD ./start.sh

FROM rasa/rasa:3.6.0

WORKDIR /app

COPY . /app

USER root
RUN pip install -r requirements.txt

USER 1001

CMD sh -c "rasa run actions --port ${ACTION_PORT:-5055} & rasa run --enable-api --cors '*' --port ${PORT:-5005} --endpoints endpoints.yml --workers 1"
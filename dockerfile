FROM python:3.9-slim-buster
RUN apt-get update && apt-get install -y \
    python3-pyqt5 \
    curl \
    build-essential \
    software-properties-common
RUN pip install pipenv
COPY Pipfile /app/Pipfile
WORKDIR /app
RUN pipenv lock
RUN pipenv requirements > requirements.txt
RUN pip install -r requirements.txt
COPY . /app
EXPOSE 8501
HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health
ENTRYPOINT ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0", "--server.fileWatcherType=watchdog"]
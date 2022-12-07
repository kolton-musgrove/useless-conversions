# 1
FROM python:3.10

# 2
RUN pip install pipenv

# 3
ENV PROJECT_DIR /app

COPY server/src Pipfile Pipfile.lock ${PROJECT_DIR}/
WORKDIR ${PROJECT_DIR}

# 4
RUN pipenv install --system --deploy

# 5
ENV PORT 8080

# 6
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 app:app
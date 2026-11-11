FROM python:3.12-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY flaskr ./flaskr
ENV FLASK_APP=flaskr
EXPOSE 8000
CMD ["sh", "-c", "[ -f instance/flaskr.sqlite ] || flask init-db; exec gunicorn -b 0.0.0.0:8000 'flaskr:create_app()'"]
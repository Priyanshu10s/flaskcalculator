FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Render automatically PORT environment variable provide karta hai
ENV PORT=5000
EXPOSE 5000

# Gunicorn ko 0.0.0.0 par bind karna zaroori hai
CMD ["sh", "-c", "gunicorn --bind 0.0.0.0:$PORT app:app"]
# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set initial working directory
WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy all project files into /app
COPY . .

# Change working directory to the subfolder containing helloworld.py
WORKDIR /app/flasky

# Set environment variable for Flask
ENV FLASK_APP=helloworld.py

# Expose port 5000
EXPOSE 5000

# Run Flask on all interfaces
CMD ["flask", "run", "--host=0.0.0.0"]
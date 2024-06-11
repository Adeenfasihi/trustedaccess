# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt requirements.txt

# Install the required dependencies
RUN pip install -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Set the environment variable for Flask
ENV FLASK_APP=trusted_access_app

# Expose port 5001 for the Flask app
EXPOSE 5001

WORKDIR /app/trusted_access_app
# Run the Flask application
CMD ["python", "run.py"]

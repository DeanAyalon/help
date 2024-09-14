# Uses a Python base image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the requirements file and install them
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Copy the source code
COPY . .

# Expose port 5000
EXPOSE 5000

# Command to run the app
CMD ["python", "app.py"]
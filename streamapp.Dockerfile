# Use a base image with Python pre-installed
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Install system-level dependencies for OpenCV
RUN apt-get update && apt-get install -y libgl1-mesa-glx

# Install required Python packages
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

RUN pip install opencv-python
RUN pip install opencv-python==4.2.0.32


# Copy your Streamlit app code into the container
COPY . /app

# Expose the port that Streamlit uses
EXPOSE 8501

# Command to run your Streamlit app
CMD ["streamlit", "run", "main.py"]
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y

pip install opencv-python opencv-python-headless
pip install opencv-python

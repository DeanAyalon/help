FROM ubuntu:latest

# Update the package list and install the required packages
RUN apt-get update && apt-get install -y \
    curl

# install git jq

# Clean up the package lists to reduce the image size
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Set the default command to run when the container starts
CMD ["bash"]
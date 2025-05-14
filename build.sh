#!/bin/bash

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Please install Docker first."
    exit 1
fi

# Create build directory if it doesn't exist
mkdir -p build

# Build the Docker image
echo "Building Docker image..."
docker build -t resume-builder .

# Run the container to compile the resume
echo "Compiling resume..."
docker run --rm -v "$(pwd):/resume" resume-builder

# Check if compilation was successful
if [ -f "build/resume.pdf" ]; then
    echo "Resume compiled successfully!"
    echo "PDF is available at: build/resume.pdf"
else
    echo "Error: Resume compilation failed."
    exit 1
fi 
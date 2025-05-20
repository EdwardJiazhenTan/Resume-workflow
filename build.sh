#!/bin/bash

# Check for correct number of arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <param1> <param2>"
    echo "Example: $0 frontend apple"
    exit 1
fi

# Assign arguments to variables for clarity
ARG1=$1
ARG2=$2
PDF_FILENAME="resume-${ARG1}-${ARG2}.pdf"

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

    # Create target directory if it doesn't exist
    mkdir -p "/home/ed/Documents/Resumes/"

    # Copy the PDF to the target directory with the new filename
    cp "build/resume.pdf" "/home/ed/Documents/Resumes/${PDF_FILENAME}"
    echo "Copied PDF to: /home/ed/Documents/Resumes/${PDF_FILENAME}"
else
    echo "Error: Resume compilation failed."
    exit 1
fi 
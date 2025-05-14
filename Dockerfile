FROM ubuntu:22.04

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install LaTeX and required packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    texlive-full \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-science \
    texlive-pictures \
    texlive-xetex \
    texlive-publishers \
    texlive-lang-english \
    texlive-lang-chinese \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /resume

# Copy resume files
COPY . .

# Default command
CMD ["pdflatex", "-output-directory=build", "src/resume.tex"] 
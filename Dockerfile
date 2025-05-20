FROM ubuntu:22.04

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install minimal LaTeX packages needed for resume
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    texlive-base \
    texlive-latex-recommended \
    texlive-fonts-recommended \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-xetex \
    lmodern \
    latexmk \
    make \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /resume

# Copy resume files
COPY . .

# Default command - using latexmk for more efficient compilation
CMD ["latexmk", "-pdf", "-output-directory=build", "src/resume.tex"] 
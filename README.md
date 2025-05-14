# Resume Workflow

A modern LaTeX resume workflow that combines Docker containerization, version control, and automated publishing to Notion. This project allows you to maintain different versions of your resume while keeping the content organized and easily modifiable.

## Project Goals and Status

| Goal | Status | Description |
|------|--------|-------------|
| Containerized LaTeX Build | ✅ Done | Render LaTeX resume by sections locally with Docker |
| Smart Resume Editing | ✅ Done | Modify resume content with Cursor AI assistance |
| Version Control | 🚧 WIP | Save history changes with Git using different branches |
| Automated Publishing | 🚧 WIP | Use GitHub Actions to store versions in Notion |

## Quick Start

### Using Docker (Recommended)
```bash
# Build the Docker image
docker build -t resume-builder .

# Generate PDF
./build.sh
```

### Local Development
Prerequisites:
- LaTeX distribution (MacTeX for macOS, TeX Live for Linux)
- Python 3.x
- Cursor IDE (for AI-assisted editing)

```bash
# Install LaTeX dependencies
# macOS
brew install --cask mactex

# Ubuntu/Debian
sudo apt-get update
sudo apt-get install texlive-full
```

## Project Structure
```
.
├── src/                    # LaTeX source files
│   ├── sections/          # Resume sections
│   │   ├── education.tex
│   │   ├── experience.tex
│   │   ├── header.tex
│   │   ├── projects.tex
│   │   └── skills.tex
│   ├── preamble.tex       # LaTeX configurations
│   └── resume.tex         # Main resume file
├── .cursor/               # Cursor IDE configurations
│   └── rules/            # Resume formatting rules
├── build/                # Generated files
├── Dockerfile            # Container configuration
├── build.sh             # Build script
├── latexmkrc            # LaTeX make configuration
└── requirements.txt     # LaTeX package dependencies
```

## Development Workflow

### 1. Making Changes
- Use Cursor IDE for AI-assisted resume editing
- Edit files in `src/sections/` for content changes
- Modify `src/preamble.tex` for styling changes

### 2. Building
```bash
# Using Docker
./build.sh

# Using local LaTeX
latexmk -pdf src/resume.tex
```

### 3. Version Control
```bash
# Create a new version branch
git checkout -b version/[company-name]

# Save changes
git add .
git commit -m "Updated resume for [company-name]"

# Push to remote
git push origin version/[company-name]
```

## Cleaning Build Files
```bash
# Remove LaTeX auxiliary files
latexmk -c

# Remove all generated files including PDF
latexmk -C

# Clean Docker build cache
docker system prune -f
```

## Future Enhancements
- [ ] Implement GitHub Actions workflow for Notion integration
- [ ] Add resume version comparison tools
- [ ] Create template switching mechanism
- [ ] Add automated formatting checks

## Troubleshooting
1. **Build Failures**
   - Check Docker logs: `docker logs resume-builder`
   - Verify LaTeX packages in `requirements.txt`
   - Clean build files and retry

2. **PDF Generation Issues**
   - Ensure all required fonts are available
   - Check LaTeX logs in `build/`
   - Verify file permissions

## Contributing
1. Fork the repository
2. Create a feature branch
3. Submit a pull request

## License
MIT License - feel free to modify and reuse this workflow for your own resume! 
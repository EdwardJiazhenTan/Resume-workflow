# Build configuration for resume.tex
$pdf_mode = 1;  # Generate PDF
$pdflatex = 'pdflatex -interaction=nonstopmode -synctex=1';

# Required packages
@default_files = ('resume.tex');

# Clean up auxiliary files
$clean_ext = 'aux bbl blg log out toc synctex.gz';

# Custom cleaning
$cleanup_includes_cusdep_generated = 1;
$cleanup_includes_generated = 1;

# Build process
$pdf_previewer = 'none';
UVic LaTeX Thesis Document Class
================================

This is a LaTeX document class for typesetting theses, dissertations,
and (M.Eng.) reports at the University of Victoria, Victoria,
British Columbia, Canada.

This document class was written by Michael Adams:

Web:
http://www.ece.uvic.ca/~mdadams

This document class is intended to be used with pdflatex.

The various files are organized as follows:

  Makefile
    The top-level makefile for building the example thesis document.
  latex/uvicthesis.cls
    The document class
  doc/*
    An example of a document using this document class.

To build the example document, invoke the following command from the
top-level directory:

    make

To control where the built document should be placed, set the OUTPUT_DIR
variable in the top-level makefile as desired.

Bug Reports
===========

Please report any bugs via an issue on GitHub:

https://github.com/mdadams/uvicthesis/issues

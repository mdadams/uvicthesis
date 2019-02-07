% Copyright 2019 Michael D. Adams
% This is a document class for preparing theses, dissertations, and reports
% at the University of Victoria, Victoria, British Columbia, Canada.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uvic_thesis}[2019/02/07 uvicthesis class]

\usepackage{ifpdf}

\RequirePackage{ifthen}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Option processing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions

\LoadClass{book}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Packages whose loading does not need to be deferred until later
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{listings}
\RequirePackage{pslatex}
\ifpdf
\RequirePackage[pdftex]{graphicx}
\else
\RequirePackage{graphicx}
\fi
\RequirePackage{boxedminipage}
\RequirePackage{comment}
\RequirePackage{verbatim}
\RequirePackage{color}
\RequirePackage{float}
\RequirePackage{caption}
\RequirePackage{placeins}
\RequirePackage[us]{datetime}
\RequirePackage{enumitem}
\RequirePackage{setspace}

\RequirePackage{fancyhdr}

% Package for epigraphs.
\RequirePackage{epigraph}

% Package for handling acronyms.
\RequirePackage{acronym}

% Define macros for index generation.
\RequirePackage{makeidx}
\makeindex

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Page layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Set margins.
\setlength{\paperwidth}{612pt}
\setlength{\paperheight}{792pt}
\setlength{\hoffset}{0pt}
\setlength{\voffset}{0pt}
\setlength{\topmargin}{-34pt}
\setlength{\textwidth}{468pt}
\setlength{\textheight}{627pt}
\setlength{\oddsidemargin}{18pt}
\setlength{\evensidemargin}{-18pt}
\setlength{\footskip}{30pt}
\setlength{\headheight}{24pt}
\setlength{\headsep}{25pt}
\setlength{\marginparsep}{0pt}
\setlength{\marginparwidth}{0pt}
\setlength{\marginparpush}{0pt}

\pagestyle{fancy}
\fancyhf{}
\fancyhead[LE,RO]{\bfseries\thepage}
\fancyhead[LO]{\bfseries\rightmark}
\fancyhead[RE]{\bfseries\leftmark}
\fancypagestyle{plain}{%
    \fancyhf{}%
    \fancyhead[LE,RO]{\bfseries\thepage}%
}

\floatplacement{figure}{tbp}
\floatplacement{table}{tbp}
\setcounter{topnumber}{5}
\setcounter{bottomnumber}{5}
\setcounter{totalnumber}{10}
\renewcommand{\topfraction}{0.70}
\renewcommand{\bottomfraction}{0.30}
\renewcommand{\textfraction}{0.20}
\renewcommand{\floatpagefraction}{0.50}
% \setlength{\floatsep}{}
% \setlength{\textfloatsep}{}
% \setlength{\intextsep}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Theorem-like environments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{lemma}{Lemma}[chapter]
\newtheorem{proposition}{Proposition}[chapter]
\newtheorem{corollary}{Corollary}[chapter]
%\theoremstyle{definition}
\newtheorem{definition}{Definition}[chapter]
\newtheorem{example}{Example}[chapter]
\newtheorem{pseudocode}{Pseudocode}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Front matter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\author#1{\gdef\uvt@author{#1}}
\def\department#1{\gdef\uvt@department{#1}}
\def\year#1{\gdef\uvt@year{#1}}
\def\title#1{\gdef\uvt@title{#1}}
\def\degrees#1{\gdef\uvt@degrees{#1}}
\def\doctype#1{\gdef\uvt@doctype{#1}}
\def\degreetype#1{\gdef\uvt@degreetype{#1}}

\renewcommand{\maketitle}{%
  \begin{center}%
    {\large\bfseries\uvt@title} \\[\baselineskip]
    by \\[\baselineskip]
    {\large \uvt@author} \\[\baselineskip]
    \begin{tabular}{c}%
    \uvt@degrees
    \end{tabular} \\[\baselineskip]
    %\\[\baselineskip]
    A \uvt@doctype\ Submitted in Partial Fulfillment of the \\[\baselineskip]
    Requirements for the Degree of \\[\baselineskip]
    \uvt@degreetype \\[\baselineskip]
    in the \uvt@department \\[\baselineskip]
    \vfill
    \begin{tabular}{cl}
    & \copyright\ \uvt@author, \uvt@year\\[\baselineskip]
    & \phantom{\copyright} University of Victoria
    \end{tabular} \\[\baselineskip]
    All rights reserved.
    This dissertation may not be reproduced in whole or in part, by \\[\baselineskip]
    photocopying or other means, without the permission of the author.
  \end{center}
  \thispagestyle{empty}
  \pagestyle{empty}
  \clearpage%
  \pagestyle{plain}
}

\newenvironment{abstract}{%
\clearpage%
\begin{center}
\textbf{ABSTRACT}
\end{center}
}{%
\clearpage%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Load hyperref package
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% NOTE: The hyperref package should always be one of the last packages loaded.
\RequirePackage[breaklinks=true,colorlinks=true,hyperindex=true,bookmarks=true,bookmarksnumbered=true,backref=false]{hyperref}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% More bibliography setup
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand*{\lstlistlistingname}{List of Listings}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Copyright 2019 Michael D. Adams
% This is a document class for preparing theses, dissertations, and reports
% at the University of Victoria, Victoria, British Columbia, Canada.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uvicthesis}[2019/03/25 uvicthesis class]

\usepackage{ifpdf}

\RequirePackage{ifthen}
\RequirePackage{etoolbox}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Option processing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\if@uvt@review%
\@uvt@reviewfalse%

\DeclareOption{review}{%
   \@uvt@reviewtrue%
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

\ProcessOptions\relax

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
\RequirePackage{tikz}

\RequirePackage{fancyhdr}

% Package for epigraphs.
\RequirePackage{epigraph}

% Package for handling acronyms.
\RequirePackage{acronym}

% Define macros for index generation.
\RequirePackage{makeidx}
\makeindex

\RequirePackage{lipsum}

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

\if@twoside%
  \fancypagestyle{plain}{%
    \fancyhf{}%
    \fancyhead[LE,RO]{\bfseries\thepage}%
  }
  \fancypagestyle{myheadings}{%
    \fancyhf{}
    \fancyhead[LE,RO]{\bfseries\thepage}
    \fancyhead[LO]{\bfseries\leftmark}
    \fancyhead[RE]{\bfseries\rightmark}
  }
\else%
  \fancypagestyle{plain}{%
    \fancyhf{}%
    \fancyhead[R]{\bfseries\thepage}%
    %\fancyfoot[C]{\bfseries\thepage}%
  }
  \fancypagestyle{myheadings}{%
    \fancyhf{}
    \fancyhead[R]{\bfseries\thepage}
    %\fancyhead[L]{\bfseries\leftmark}
    %\fancyhead[R]{\bfseries\rightmark}
    %\fancyfoot[C]{\bfseries\thepage}
  }
\fi%


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
    {\large\bfseries\uvt@title} \\%[\baselineskip]
    \vspace*{2em}%
    by \\%[\baselineskip]
    \vspace*{2em}%
    {\large \uvt@author} \\%[\baselineskip]
    \vspace*{1em}%
    \begin{tabular}{c}%
    \uvt@degrees
    \end{tabular} \\%[\baselineskip]
    %\\[\baselineskip]
    \vspace*{4em}%
    A \uvt@doctype\ Submitted in Partial Fulfillment of the \\%[\baselineskip]
    Requirements for the Degree of \\%[\baselineskip]
    \vspace*{1em}%
    {\scshape\uvt@degreetype} \\%[\baselineskip]
    \vspace*{1em}%
    in the \uvt@department \\%[\baselineskip]
    \vfill
    \begin{tabular}{cl}
    & \copyright\ \uvt@author, \uvt@year\\%[\baselineskip]
    & \phantom{\copyright} University of Victoria
    \end{tabular} \\%[\baselineskip]
    \vspace*{1em}%
    All rights reserved.
    This \MakeLowercase{\uvt@doctype}\ may not be reproduced
    in whole or in part, by \\%[\baselineskip]
    photocopying or other means, without the permission of the author.
  \end{center}
  \thispagestyle{empty}
  \pagestyle{empty}
  \clearpage%
  \pagestyle{plain}
  \begin{center}%
    {\large\bfseries\uvt@title} \\%[\baselineskip]
    \vspace*{2em}%
    by \\%[\baselineskip]
    \vspace*{2em}%
    {\large \uvt@author} \\%[\baselineskip]
    \vspace*{1em}%
    \begin{tabular}{c}%
    \uvt@degrees
    \end{tabular} \\%[\baselineskip]
    %\\[\baselineskip]
  \end{center}%
  \vspace*{1.00in}
  \addcontentsline{toc}{chapter}{Supervisory Committee}
  {\bfseries Supervisory Committee} \\%[\baselineskip]
  \vspace*{1em}%
  \committee%
  \clearpage%
  \pagestyle{plain}%
  %\pagestyle{myheadings}%
}

\newenvironment{abstract}{%
\clearpage%
\addcontentsline{toc}{chapter}{Abstract}%
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
\RequirePackage[linktoc=all,breaklinks=true,colorlinks=true,hyperindex=true,bookmarks=true,bookmarksnumbered=true,backref=false]{hyperref}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% More bibliography setup
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand*{\lstlistlistingname}{List of Listings}

% Number the bibliography section and include it in the TOC.
% NOTE: We must override the thebibliography environment before the bibunits
% and natbib packages are loaded.
\renewenvironment{thebibliography}[1]
   {\chapter{\bibname}%
    \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
    \list{\@biblabel{\@arabic\c@enumiv}}%
         {\settowidth\labelwidth{\@biblabel{#1}}%
          \leftmargin\labelwidth
          \advance\leftmargin\labelsep
          \@openbib@code
          \usecounter{enumiv}%
          \let\p@enumiv\@empty
          \renewcommand\theenumiv{\@arabic\c@enumiv}}%
    \sloppy
    \clubpenalty4000
    \@clubpenalty \clubpenalty
    \widowpenalty4000%
    \sfcode`\.\@m}
   {\def\@noitemerr
     {\@latex@warning{Empty `thebibliography' environment}}%
    \endlist}

\newenvironment{acknowledgments}{%
  \section*{Acknowledgments}%
  \addcontentsline{toc}{section}{Acknowledgments}%
  \markboth{}{}%
  }{%
}

\newenvironment{dedication}{%
  \cleardoublepage%
  \markboth{}{}%
  \addcontentsline{toc}{section}{Dedication}%
  \null\vfill%
}{%
  \vfill\null%
  \clearpage%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\panellist}[3]{%
  \vspace*{0.375in}%
  \par\noindent\rule{\linewidth}{0.5mm} \\
  #1, #2 \\ (#3)
}

% Probably this should be commented out.
\pretocmd{\tableofcontents}{\addcontentsline{toc}{chapter}{Table of Contents}}{}{}
\pretocmd{\listoffigures}{\addcontentsline{toc}{chapter}{List of Figures}}{}{}
\pretocmd{\listoftables}{\addcontentsline{toc}{chapter}{List of Tables}}{}{}
\pretocmd{\lstlistoflistings}{\addcontentsline{toc}{chapter}{List of Listings}}{}{}

\apptocmd{\mainmatter}{\pagestyle{myheadings}}{}{}

\apptocmd{\bibliography}{\cleardoublepage}{}{}
\apptocmd{\printindex}{\cleardoublepage}{}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\reviewmode}{%
  \doublespacing%
}

\if@uvt@review%
  \reviewmode%
\fi

\newcommand{\preface}{%
  \chapter*{Preface}
  \addcontentsline{toc}{chapter}{Preface}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\endinput

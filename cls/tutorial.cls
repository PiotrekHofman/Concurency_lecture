\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{courseworks}[2026/10/02 Custom Courseworks Document Class]

% 1. Declare Font Options
\newif\iflmodern
\lmodernfalse

\DeclareOption{lmodern}{\lmoderntrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% 2. Load Base Class & Core Packages
\LoadClass[11pt]{article}

\RequirePackage[a4paper,margin=25mm]{geometry}
\RequirePackage{enumitem}
\RequirePackage{hyperref}
\RequirePackage{datetime}

% 3. Font Engine & Math Alphabets Configuration
\iflmodern
  \RequirePackage[T1]{fontenc}
  \RequirePackage{amssymb,amsfonts,amsmath,amsthm}
  % Reset \mathcal before loading Euler calligraphic
  \let\mathcal\undefined
  \let\mathbfcal\undefined
  \RequirePackage[cal=euler]{mathalpha}
\else
  \RequirePackage{fontspec}
  \RequirePackage{unicode-math}
  \RequirePackage{amsmath,amsthm}
  
  \setmainfont{OldStandard-Regular.otf}[
    BoldFont       = OldStandard-Bold.otf,
    ItalicFont     = OldStandard-Italic.otf,
    BoldItalicFont = OldStandard-BoldItalic.otf
  ]
  \setmathfont{OldStandard-Math.otf}
  
  % Reset \mathcal before loading Euler calligraphic alongside OldStandard
  \let\mathcal\undefined
  \let\mathbfcal\undefined
  \RequirePackage[cal=euler]{mathalpha}
\fi

% 4. List Spacing Setup
\setlist[enumerate]{itemsep=0.35em,topsep=0.4em}
\setlist[itemize]{itemsep=0.25em,topsep=0.4em}

% 5. Custom Math Macros
\newcommand{\Conf}{\mathsf{Conf}}
\newcommand{\Act}{\mathsf{Act}}
\newcommand{\eps}{\varepsilon}

% 6. Date Handling Setup
\makeatletter
% Define custom date format YYYY/MM/DD, DayName
\newdateformat{yyyymmddndate}{%
  \dayofweekname{\THEDAY}{\THEMONTH}{\THEYEAR}, \two@digits{\THEDAY}/\two@digits{\THEMONTH}/\THEYEAR%
}

% Initialize default date to \today
\newcommand{\tutori@ld@te}{\today}

% Command \tutorial{Day}{Month}{Year} to set a hardcoded date
\newcommand{\tutorial}[3]{%
  \newdate{tutori@ldate@var}{#1}{#2}{#3}%
  \renewcommand{\tutori@ld@te}{\displaydate{tutori@ldate@var}}%
}

% Override \formatdate to output the formatted date
\renewcommand{\formatdate}{\yyyymmddndate\tutori@ld@te}

% 7. Custom Document Variables
\newcommand{\semester}[1]{\def\@semester{#1}}
\newcommand{\documenttitle}[1]{\def\@documenttitle{#1}}
\newcommand{\coursetitle}[1]{\def\@coursetitle{#1}}
\newcommand{\lecturer}[1]{\def\@lecturer{#1}}

% 8. Redefine \maketitle Header
\renewcommand{\maketitle}{%
  \noindent
  \parbox[b]{0.25\textwidth}{\raggedright \Large \@semester}%
  \hfill
  \parbox[b]{0.45\textwidth}{\centering \textbf{\LARGE\scshape \@coursetitle}}%
  \hfill
  \parbox[b]{0.25\textwidth}{\raggedleft \Large \@lecturer}%
  \vspace{1.5em}
  \centerline{\large\bfseries \@documenttitle}%
  \vspace{1.5em}%
}
\makeatother

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

% 3. Font Engine & Math Alphabets Configuration
\iflmodern
  \RequirePackage[T1]{fontenc}
  \RequirePackage{amssymb,amsfonts,amsmath,amsthm}
  % Reset \mathcal before loading Euler calligraphic
  \let\mathcal\undefined
  \let\mathbfcal\undefined
  \let\mathbb\undefined
  \let\mathbfbb\undefined
  \let\mathscr\undefined
  \let\mathbfscr\undefined
  \RequirePackage[bb=boondox,cal=euler,scr=mt]{mathalpha}
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
  \let\mathbb\undefined
  \let\mathbfbb\undefined
  \let\mathscr\undefined
  \let\mathbfscr\undefined
  \RequirePackage[bb=boondox,cal=euler,scr=mt]{mathalpha}
  
	% \newVdash: Double vertical bar, single horizontal extension
	%\rule[lift]{width}{height}
	% #1: Length of the horizontal dash (default 1.2em)
	\makeatletter
	\newcommand{\oldstdmodels@}[2]{%
	%  #1\vert\mkern-8mu=%
	  \mathord{#1\vert}%
	  \mkern-3mu%
	  \mathord{#1=}%
	}
	\newcommand{\oldstmodels}{\mathrel{\mathpalette\oldstdmodels@{}}}
	\makeatother
	
	\AtBeginDocument{%
	  \let\models\oldstmodels
	  \let\mmodels\oldstmodels
	}
\fi

%% 4.5 Loading other packages
\RequirePackage[a4paper,margin=25mm]{geometry}
\RequirePackage{enumitem}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{datetime}
\RequirePackage{cleveref}
\RequirePackage{xparse}


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
\renewcommand{\abstract}[1]{\def\@abstract{#1}}
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
  \vspace{1.5em}
  \centerline{\normalsize Today: \slshape \@abstract}%
  \vspace{1.5em}
}
\makeatother

\RequirePackage{xcolor}
\renewcommand{\thefootnote}{\color{red}(\arabic{footnote})}

\DeclareMathOperator{\Pre}{Pre}
\DeclareMathOperator{\Post}{Post}

\RequirePackage{titlesec}
\renewcommand{\thesubsection}{\arabic{subsection}.\hskip -7pt}


\newcounter{exercise}
\NewDocumentEnvironment{exercise}{O{} o}
{%
  \par\medskip\noindent
  \IfNoValueTF{#2}
    {\refstepcounter{exercise}}
    {\setcounter{exercise}{\numexpr#2-1\relax}%
     \refstepcounter{exercise}}%
  \textbf{Exercise \theexercise.}%
  \if\relax\detokenize{#1}\relax
  \else
    \ [\textit{#1}]%
  \fi
  \ %
}
{\par\medskip}

\crefname{exercise}{exercise}{exercises}
\Crefname{exercise}{Exercise}{Exercises}
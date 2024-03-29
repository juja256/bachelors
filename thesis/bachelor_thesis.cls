% ********** Клас для написання пояснювальної записки **********
% *********  до атестаційної роботи ступеня бакалавра **********
% ***** автори: Тавров Д. Ю., Борисенко П. Б., Дутчак І. О. ****

% 1. Ідентифікуємо клас
\ProvidesClass{bachelor_thesis}[2015/12/24 v3.0 Клас для написання пояснювальної записки]
\NeedsTeXFormat{LaTeX2e} % потрібний формат


% 2. Завантажуємо "батьківський клас"
\LoadClass[a4paper,ukrainian,oneside]{extreport}


% 3. Завантажуємо пакети
% мовні пакети
% \usepackage{pgfplots}

\RequirePackage{cmap}% для кодування шрифтів у pdf
\RequirePackage[T2A]{fontenc} % пакет для підтримки кирилічних шрифтів
\RequirePackage[utf8]{inputenc} % пакет для підтримкм Windows'івського кодування cp1251
\RequirePackage[russian,ukrainian]{babel} % пакет для підтримки української та російської мов
%\RequirePackage{pscyr} % пакет із гарними кирилічними шрифтами
\RequirePackage{mathtext} % потрібні символи в режимі математичних формул
\RequirePackage{amssymb,amsfonts,amsmath,amsthm,mathtools} % потрібні символи в режимі математичних формул
\RequirePackage{textcomp} % потрібні символи в режимі математичних формул
\RequirePackage{upgreek} % пакет для прямих грецьких літер
%\RequirePackage{pgfplots}


% графічні пакети
\RequirePackage{graphicx} % основний пакет для вставки графіки
\RequirePackage{subfig} % пакет для вставки підрисунків
\RequirePackage{flafter} % пакет гарантує, що рисунок чи таблиця ніколи не з'являться раніше посилання на самих себе
\RequirePackage{caption} % пакет для персоналізації заголовків рисунків та таблиць
\RequirePackage{xtab} % пакет для довгих таблиць
\RequirePackage{longtable} % пакет для довгих таблиць
\RequirePackage{multirow} % пакет для об'єднання рядків таблиці
\RequirePackage{array} % пакет для вирівнювання всередині таблиці

% пакети для форматування відступів та полів
\RequirePackage[includehead, headsep=0pt, footskip=0pt, top=2cm, bottom=2cm, left=3cm, right=1.5cm]{geometry} % задаємо поля сторінки
\RequirePackage{indentfirst} % відступ для першого рядка абзацу
\RequirePackage{hanging} % відступ для всіх інших рядків абзацу
\RequirePackage[shortlabels]{enumitem}  % пакет для форматування списків
\RequirePackage{setspace}       % пакет для того, щоб можна було задати міжрядковий інтервал
\RequirePackage{fancyhdr} % пакет потрібний для виставлення позиції номеру сторінки
\RequirePackage{etoolbox} % пакет для прибирання висячого відступу в бібліографії та прописування умовних відстаней між заголовками

% стилі заголовків та змісту
\RequirePackage[rm,small,raggedright]{titlesec} % пакет для ручного керування стилем заголовків
\RequirePackage[titles,subfigure]{tocloft} % пакет для ручного керування стилем змісту

% пакет для коректного представлення інтернет-посилань у "Переліку посилань"
\RequirePackage{url}

% пакет для нормальних пробілів після ком у десяткових дробах
\RequirePackage{icomma}

% пакет для відображення форматування вихідних кодів
\RequirePackage{listings}

% пакет для параметричних команд
\RequirePackage{xkeyval}

% пакет для гіперпосилань у змісті
\RequirePackage[hidelinks]{hyperref}

% пакет для кодів програм
\RequirePackage{verbatim}

% Поддержка переносоустойчивых подчёркиваний и зачёркиваний
\RequirePackage{soul}   


                                

% 4. Основна частина
\frenchspacing
\doublespacing % інтервал "1,5" між рядками

\newcommand{\setfontsize}[1]{\fontsize{#1pt}{#1pt}\selectfont} % команда для задавання розміру шрифта
\newcommand{\invcommas}[1]{\guillemotleft #1\guillemotright} % команда для французьких кутових лапок

% текст гіперпосилань буде того ж шрифту, що й основний текст
\urlstyle{same}

% стиль сторінки для позиції номеру сторінки
\fancypagestyle{plain}{
    \fancyhf{}
    \rhead{\thepage}
                \renewcommand{\headrulewidth}{0pt}
                \renewcommand{\footrulewidth}{0pt}
}

% команди для заборони розриву формул у небажаному місці
\binoppenalty=10000
\relpenalty=10000

% команди для заборони використання перенесень
\tolerance=1
\emergencystretch=\maxdimen
\hyphenpenalty=10000
\hbadness=10000

% команда для створення ненумерованого розділу, який тим не менше показується в змісті
\newcommand{\uchapter}[1]{\chapter*{#1}\addcontentsline{toc}{chapter}{#1}} 

% для створення вступу використаємо команду \uchapter
\newcommand{\intro}{\uchapter{Вступ}}

% для створення висновків використаємо команду \uchapter
\newcommand{\conclusions}{\uchapter{Висновки}}

% для створення переліку умовних позначень використаємо команду \shortings
\newcommand{\shortings}{\uchapter{Перелік умовних позначень, скорочень і термінів}}

% хитра команда для створення додатків
\newcounter{appendnum}
\newcommand{\append}[1]{
\setcounter{chapter}{0}
\setcounter{figure}{0}
\setcounter{table}{0}
\setcounter{section}{0}
\setcounter{subsection}{0}
\titleformat{\chapter}{\centering\Large\bfseries\MakeUppercase}{\hspace{1cm}\thechapter}{0.5em}{}
\chapter*{ДОДАТОК \Asbuk{appendnum}~~#1}
\addcontentsline{toc}{chapter}{Додаток \Asbuk{appendnum}\ #1}
\addvspace{-28pt}
\preto\section{%
        \ifnum\value{section}=0\addvspace{0pt}\fi%
}
\renewcommand{\thefigure}{\Asbuk{appendnum}.\arabic{figure}}
\renewcommand{\thetable}{\Asbuk{appendnum}.\arabic{table}}
\renewcommand{\thesection}{\Asbuk{appendnum}.\arabic{section}}
\renewcommand{\thesubsection}{\Asbuk{appendnum}.\arabic{section}.\arabic{subsection}}
}
% прибираємо недопустимі букви з позначення додатків
\pretocmd\append{
        \stepcounter{appendnum}
        \ifnum\Asbuk{appendnum}=Ґ \stepcounter{appendnum}\fi
        \ifnum\Asbuk{appendnum}=Є \stepcounter{appendnum}\fi
        \ifnum\Asbuk{appendnum}=З \stepcounter{appendnum}\fi
        \ifnum\Asbuk{appendnum}=І \stepcounter{appendnum}\fi
        \ifnum\Asbuk{appendnum}=Ї \stepcounter{appendnum}\fi
        \ifnum\Asbuk{appendnum}=Й \stepcounter{appendnum}\fi
        \ifnum\Asbuk{appendnum}=О \stepcounter{appendnum}\fi
        \ifnum\Asbuk{appendnum}=Ч \stepcounter{appendnum}\fi
        \ifnum\Asbuk{appendnum}=Ь \stepcounter{appendnum}\fi
}{}{}

% будемо змінювати стилі заголовків
% спочатку --- для розділу
\titleformat{\chapter} % указуємо, що модифікуємо саме розділ
                        {\centering\Large\MakeUppercase} % указуємо формат назви ("усі великі")
                        {\bfseries\thechapter} % указуємо формат власне номера: це буде просто число, без крапки
                        {0.5em} % відстань між номером і назвою
                        {\bfseries} % текст, що передує назві
        
% тепер --- для підрозділу
\titleformat{\section}[block] % указуємо, що модифікуємо саме підрозділ
                        {\Large} % указуємо формат назви (жирний)
                        {\bfseries\thesection} % указуємо формат власне номера: це буде просто число, без крапки
                        {0.5em} % відстань між номером і назвою
                        {\bfseries} % текст, що передує назві

% тепер --- для підрозділу ще нижчого рівня
\titleformat{\subsection}[block] % указуємо, що модифікуємо саме підрозділ нижнього рівня
                        {\Large} % указуємо формат назви (жирний)
                        {\bfseries\thesubsection} % указуємо формат власне номера: це буде просто число, без крапки
                        {0.5em} % відстань між номером і назвою
                        {\bfseries} % текст, що передує назві
                        
% тепер задамо відступи для заголовку розділу
\titlespacing{\chapter} % указуємо, що модифікуємо саме розділ
                        {0pt} % відступ зліва
                        {-28pt} % відступ зверху (немає)
                        {48pt} % відступ знизу (2 рядки)

% тепер задамо відступи для заголовку підрозділу                        
\titlespacing{\section} % указуємо, що модифікуємо саме підрозділ
                        {\parindent} % відступ зліва
                        {48pt} % відступ зверху (2 рядки)
                        {48pt} % відступ знизу (2 рядки)

% тепер задамо відступи для заголовку підрозділу без нумерації                  
\titlespacing{name=\section,numberless} 
                        {\parindent}  % відступ зліва
                        {48pt} % відступ зверху (2 рядки)
                        {48pt} % відступ знизу (2 рядки)

                        
% тепер задамо відступи для заголовку пункта
\titlespacing{\subsection} % указуємо, що модифікуємо саме пункт
                        {\parindent} % відступ зліва
                        {48pt} % відступ зверху (2 рядки)
                        {48pt} % відступ знизу (2 рядки)

% тепер зробимо так, щоб між двома заголовками була звичайна відстань
\preto\section{%
        \ifnum\value{section}=0\addvspace{-48pt}\fi%
}

\preto\subsection{%
        \ifnum\value{subsection}=0\addvspace{-48pt}\fi%
}

\newcommand{\chapconclude}[1]{\section*{Висновки до розділу #1} \addcontentsline{toc}{section}{Висновки до розділу #1}}
                        
% видозмінюємо зміст
\makeatletter
\renewcommand{\tableofcontents}{
        \clearpage
        \thispagestyle{empty}

        \begin{center}
          \bfseries \MakeUppercase{Зміст}
        \end{center}
        
        \addvspace{42pt}
        
        \@starttoc{toc}
}
\makeatother

% змінюємо формат нумерації формул
\renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}}

% задамо оновлені списки, з правильними відступами
% нумерований першого рівня
\AddEnumerateCounter{\asbuk}{\@asbuk}{\cyrm}
\setlist[itemize,1]{label=--, partopsep=0pt, parsep=0pt, topsep=0pt, itemsep=0pt, itemindent=1.7cm, leftmargin=0pt}
\setlist[itemize,2]{label=--, partopsep=0pt, parsep=0pt, topsep=0pt, itemsep=0pt, itemindent=2.25cm, leftmargin=0pt}
\setlist[enumerate,1]{label=\arabic*), partopsep=0pt, parsep=0pt, topsep=0pt, itemsep=0pt, itemindent=1.9cm, leftmargin=0pt}
\setlist[enumerate,2]{label=\asbuk*), partopsep=0pt, parsep=0pt, topsep=0pt, itemsep=0pt, itemindent=2.6cm, leftmargin=0pt}

% тепер займемося змістом
% задаємо відстань між точками
\renewcommand{\cftchapdotsep}{1}
\renewcommand{\cftsecdotsep}{1}
\renewcommand{\cftsubsecdotsep}{1}

% задаємо розмір поля, що виділяється під номер сторінки
\cftsetpnumwidth{1em}

% задамо відстані між рядками в змісті
\setlength\cftbeforechapskip{0pt}

% займемося розділами
\renewcommand{\cftchapaftersnum}{} % що буде писатися після номеру розділу (нічого)
\renewcommand{\cftchapindent}{0cm} % відступ номера розділу від лівого краю
\renewcommand{\cftchapnumwidth}{1em} % розмір поля, що виділяється під номер розділу
\renewcommand{\cftchappagefont}{\mdseries} % стиль номеру сторінки (звичайний, 14pt)
\renewcommand{\cftchapfont}{\mdseries} % стиль заголовку (звичайний)
\renewcommand{\cftchapleader}{\cftdotfill{\cftchapdotsep}} % чим заповнювати проміжок від заголовку до номеру сторінки (точками)

% тепер займемося підрозділами
\renewcommand{\cftsecaftersnum}{} % що буде писатися після номеру підрозділу (нічого)
\renewcommand{\cftsecindent}{1em} % відступ номера підрозділу від лівого краю
\renewcommand{\cftsecnumwidth}{2em} % розмір поля, що виділяється під номер підрозділу
\renewcommand{\cftsecpagefont}{\mdseries} % стиль номеру сторінки (звичайний, 14pt)
\renewcommand{\cftsecfont}{\mdseries} % стиль заголовку (звичайний)
\renewcommand{\cftsecleader}{\cftdotfill{\cftsecdotsep}} % чим заповнювати проміжок від заголовку до номеру сторінки (точками)

% тепер займемося пунктами
\renewcommand{\cftsubsecaftersnum}{} % що буде писатися після номеру пункта (нічого)
\renewcommand{\cftsubsecindent}{3em} % відступ номера пункта від лівого краю
\renewcommand{\cftsubsecnumwidth}{2.5em} % розмір поля, що виділяється під номер пункта
\renewcommand{\cftsubsecpagefont}{\mdseries} % стиль номеру сторінки (звичайний, 14pt)
\renewcommand{\cftsubsecfont}{\mdseries} % стиль заголовку (звичайний)
\renewcommand{\cftsubsecleader}{\cftdotfill{\cftsubsecdotsep}} % чим заповнювати проміжок від заголовку до номеру сторінки (точками)

% заголовки таблиць, рисунків і лістингів
\DeclareCaptionLabelFormat{tablecap}{Таблиця #2} % формат за промовчанням "Табл." не влаштовує
\DeclareCaptionLabelFormat{figurecap}{Рисунок #2} % формат за промовчанням "Рис." не влаштовує
\DeclareCaptionFormat{listing}{Лістинг файлу #3} % формат за промовчанням "Listing" не влаштовує

\captionsetup[table]{margin=0pt,singlelinecheck=false, justification=justified, labelsep=endash, labelformat=tablecap, font = {stretch = 1.5, Large}, belowskip=18pt, aboveskip=3pt} % формат для таблиць
\captionsetup[figure]{justification=centering, labelsep=endash, labelformat=figurecap, font = {stretch = 1.5, Large}} % формат для рисунків
\captionsetup[lstlisting]{margin=0pt, format=listing, singlelinecheck=false, font = {stretch = 1.5}} % формат для лістингів

\setlength{\textfloatsep}{21pt}
\setlength{\intextsep}{21pt}

% команда, що змінює латинські літери на кирилічні в підрисунках
\renewcommand{\thesubfigure}{\asbuk{subfigure}}

% нове оточення для довгих таблиць
\renewenvironment{table}[4]{
        \begingroup\centering
        \setlength{\LTpre}{-14pt}
  \setlength{\LTpost}{14pt}
  \setlength{\LTcapwidth}{0pt}
  \begin{longtable}{#1}
                \kill
                \caption{#2}\label{#3}\\
                #4
                \endfirsthead
                \kill
                \caption*{Продовження таблиці \thetable}\\
                #4
                \endhead
                \hline
                \endfoot
}
        {%
        \end{longtable}
        \endgroup       
}

% наведемо порядок із відступами в бібліографії
\patchcmd{\thebibliography}
  {\advance\leftmargin\labelsep}
  {\leftmargin=0pt\itemindent=1.9cm\advance\itemindent\labelsep}
  {}{}

% змінюємо формат номеру для переліку посилань (число + крапка)
\makeatletter
\renewcommand{\@biblabel}[1]{#1.}
\makeatother

% оновимо стандартне оточення, оскільки потрібно додати перелік посилань у зміст
\let\tempbib\thebibliography
\let\tempbibend\endthebibliography
\renewenvironment{thebibliography}{
        \renewcommand{\bibname}{ПЕРЕЛІК ПОСИЛАНЬ}% змінюємо заголовок
        \tempbib{99.}% максимально можливий номер джерела --- 99
        % далі наведемо порядок із відступами
        \setlength\partopsep{0pt}
        \setlength\parskip{0pt}
        \setlength\parsep{0pt}
        \setlength\topsep{0pt}
        \setlength\itemsep{0pt}
        \addcontentsline{toc}{chapter}{Перелік посилань}% додаємо в зміст
        }
        {
        \tempbibend
}

% спеціальна команда для вставки лістингів
\newcommand{\listing}[2]{\singlespacing\lstinputlisting[language=C++, basicstyle=\tiny, breaklines=true, caption={#1}]{#2}\doublespacing}

\theoremstyle{plain}
\newtheorem{theorem}{\indent Теорема}[chapter]
\newtheorem{claim}{\indent Твердження}[chapter]
\newtheorem{lemma}{\indent Лема}[chapter]
\newtheorem{corollary}{\indent Наслідок}[chapter]
\theoremstyle{definition}
\newtheorem{definition}{\indent Визначення}[chapter]
%\newtheorem{algorithm}{\indent Алгоритм}[chapter]
\newtheorem{problem}{\indent Задача}[chapter]
\newtheorem{example}{\indent Приклад}[chapter]
\theoremstyle{remark}
\newtheorem*{remark}{\indent\textbf{Зауваження}}
\renewenvironment{proof}{{\indent\bfseries Доведення.~}}{\qed}
%\renewcommand*{\proofname}{Доведення}


% нові команди для анотацій
% трьома мовами
\newcommand{\abstractUkr}{\chapter*{РЕФЕРАТ}\thispagestyle{empty}\renewcommand{\arraystretch}{1.5}\setfontsize{14}}
\newcommand{\abstractRus}{\chapter*{РЕФЕРАТ}\thispagestyle{empty}\renewcommand{\arraystretch}{1.5}\setfontsize{14}}
\newcommand{\abstractEng}{\chapter*{ABSTRACT}\thispagestyle{empty}\renewcommand{\arraystretch}{1.5}\setfontsize{14}}



% виправляємо помилки з апострофами в формулах
\makeatletter
\def\latex@@rquote{^\bgroup\prim@s} 
\let\hang@@h@ngrquote\h@ngrquote
\renewcommand{\h@ngrquote}{
        \relax\ifmmode
                \expandafter\latex@@rquote
        \else
                \expandafter\hang@@h@ngrquote
        \fi}
\makeatother


% todo -- на все случаи жизни
\newcommand{\todo}[1]{\textcolor{red}{#1}}


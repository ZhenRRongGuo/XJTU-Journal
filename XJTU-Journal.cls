% XJTU-Journal.cls
% 通过\documentclass{XJTU-Journal}使用
% 本模板通过西安交通大学学报官网Word模板制作而成，如果您因为某个课程作业需要，但又不想用Word，那么可以使用此模板
% 参考文献使用biblatex，由biber编译，因此编译顺序为 xelatex -> biber -> xelatex -> xelatex
%%%%%%%% 本模板仅为自用，不得用于学报投稿，如果需要投稿，请安装期刊需求提供稿件 %%%%%%%%

%%% 文档类信息 %%%
\NeedsTeXFormat{LaTeX2e}
\RequirePackage{expl3}
\ProvidesClass{XJTU-Journal}[2025/12/4 1.0.0 JOURNAL OF XI'AN JIAOTONG UNIVERSITY]
\def\xjtuthesis{XJTU-Journal}
\def\meta@version{1.0.0}
\def\metaversion{\meta@version}

\LoadClass[twoside,twocolumn]{article}

\PassOptionsToPackage{no-math}{fontspec}%保证mathspec在中文中的正常使用
\RequirePackage[zihao=5]{ctex}%中文设置
\RequirePackage{CJK}
\RequirePackage{float}%浮动体设置
\RequirePackage[hidelinks,bookmarksnumbered=true]{hyperref}%加超链接，需要连续编译两次
\RequirePackage{paralist}%使用inparaenum环境
\RequirePackage{fancyhdr}%页眉页脚
\RequirePackage{amsmath}%多行公式
\RequirePackage{amssymb}%获得额外的数学符号
\RequirePackage{mathspec}%必须在amsmath宏包之后，且不能加载fontspec宏包
\RequirePackage{multirow}%表格中单元格可以合并
\RequirePackage{graphicx}%可以插入图片
\RequirePackage{subcaption}%子图
\RequirePackage[export]{adjustbox}%图片可加边框
\RequirePackage{booktabs}%三线表
\RequirePackage{tabularx}%处理表格列宽
\RequirePackage{makecell}%表格内容换行
\RequirePackage{xltabular}%长表格
\RequirePackage{titlesec}%修改标题样式
\RequirePackage{changepage}%过宽内容
\RequirePackage{tikz}%绘图用
\RequirePackage{fixltx2e}%通栏浮动体编号问题
\usetikzlibrary{shapes.geometric, arrows}
% 流程图定义基本形状
\tikzstyle{startstop} = [rectangle, rounded corners, minimum width = 2cm, minimum height=0.5cm,text centered, draw = black]
\tikzstyle{io} = [trapezium, trapezium left angle=70, trapezium right angle=110, minimum width=2cm, minimum height=0.5cm, text centered, draw=black]
\tikzstyle{process} = [rectangle, minimum width=2cm, minimum height=0.5cm, text centered, draw=black]
\tikzstyle{decision} = [diamond, aspect = 2.7, text centered, draw=black]
\tikzstyle{coord} = [rectangle, minimum width=0cm, minimum height=0cm, text centered, draw=black]
% 箭头形式
\tikzstyle{arrow} = [->,>=stealth]
\RequirePackage{appendix}%可使用附录
\RequirePackage{titletoc}%自定义目录
\RequirePackage[a4paper,left=1.8cm,right=1.8cm,top=2.54cm,bottom=2.54cm]{geometry}
\setlength\columnsep{0.6cm}%设置两栏之间的间距为0.6cm
\RequirePackage{balance}%平衡双栏
\RequirePackage{cuted}%通栏
\RequirePackage[justification=centering]{caption} % 用于定制标题样式（如果需要）



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%% 自定义命令 %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\everymath{\displaystyle}%将行内公式转化为行间公式效果
\newcommand{\Runit}[1]{{\rm ~ #1}}%一个自定义的单位输入方法
\newcolumntype{Y}{>{\centering\arraybackslash}X}%居中问题
\newcolumntype{Z}{>{\raggedleft\arraybackslash}X}%居右问题
\setlength{\abovecaptionskip}{-0em} % 设置标题与图片之间的间距
% \setlength{\abovecaptionskip}{-0.2em} % 设置标题与图片之间的间距
\setlength{\belowcaptionskip}{0em} % 设置标题与下文之间的间距
\setallmainfonts{Times New Roman}%设置英文和公式字体为新罗马
\setCJKmainfont[AutoFakeBold=true]{SimSun}% 宋体直接加粗
\newcommand{\cel}{~^\circ {\rm C}}%自定义℃
\newcommand{\diff}{{\rm \,d}}%定义微分号
\newcommand{\Diff}{{\rm D}}%定义微分号
\newcommand{\ve}[1]{\boldsymbol{\mathit{#1}}}% 自定义矢量符号，加粗斜体
\renewcommand{\Phi}{\varPhi}%大写φ斜体
\newcommand{\hndm}[1]{\tikz[baseline=(MeNode.base)]{\node[rounded corners, fill=gray!20](MeNode){#1};} \texttt{}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%% 中文字号 %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\erhao}{\fontsize{22pt}{22pt}\selectfont}       % 二号，1.0倍行距
\newcommand{\xiaoer}{\fontsize{18pt}{18pt}\selectfont}      % 小二, 1.0倍行距
\newcommand{\sanhao}{\fontsize{16pt}{16pt}\selectfont}      % 三号, 1.0倍行距
\newcommand{\xiaosan}{\fontsize{15pt}{15pt}\selectfont}     % 小三, 1.0倍行距
\newcommand{\sihao}{\fontsize{14pt}{14pt}\selectfont}       % 四号, 1.0倍行距
\newcommand{\xiaosi}{\fontsize{12pt}{12pt}\selectfont}      % 小四, 1.0倍行距
\newcommand{\wuhao}{\fontsize{10.5pt}{10.5pt}\selectfont}   % 五号, 1.0倍行距
\newcommand{\xiaowu}{\fontsize{9pt}{9pt}\selectfont}        % 小五, 1.0倍行距
\newcommand{\liuhao}{\fontsize{7.5pt}{7.5pt}\selectfont}    % 六号, 1.0倍行距
\newcommand{\xiaoliu}{\fontsize{6.5pt}{6.5pt}\selectfont}   % 小六, 1.0倍行距



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%% 修改标题样式 %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 一级标题 4号宋体
\titleformat{\section}[block]
    {\fontsize{14pt}{21pt}\selectfont}{\arabic{section}}{1em}{}
% 二级标题 5号黑体
\titleformat{\subsection}[block]
    {\wuhao\heiti\selectfont}{\arabic{section}.\arabic{subsection}}{7pt}{}
\titleformat{\subsubsection}[block]
    {\wuhao\heiti\selectfont}{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}{7pt}{}
\titlespacing{\section}{0pt}{0ex}{0.5ex}
\titlespacing{\subsection}{0pt}{0.5ex}{0.5ex}
\titlespacing*{\subsubsection}
    {0pt}% 标题左侧额外空间  
    {0.5ex}% 标题上方额外空间  
    {0ex}% 标题下方额外空间 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%% 摘要格式设置 %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\zhAbstract}[2]{
    \wuhao\noindent{\textbf{摘要}\heiti：}{\kaishu #1}

    \wuhao\noindent{\textbf{关键词}\heiti：}{\kaishu #2}

    \wuhao\noindent{\textbf{中图分类号}{\heiti：} \hfill \textbf{文献标识码：A}\qquad\qquad\qquad}

    \wuhao\noindent{ DOI: \hphantom{10.7652/xjtuxb202208000       }\heiti 文章编号：}
}

\newcommand{\enAbstract}[2]{
    \wuhao\noindent{\textbf{Abstract:} }{ #1}

    \wuhao\noindent{\textbf{Key words:} }{ #2}

    \quad%空一行
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%% 参考文献设置 %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[hyperref=true,backend=biber,url=false,doi=false,sorting=none,style=gb7714-2015,gbpunctin=false,gbpub=false,gbnamefmt=lowercase]{biblatex}
\DefineBibliographyStrings{english}{in={}}
\renewcommand{\bibfont}{\xiaowu} % 设置参考文献字体
\setlength{\bibitemsep}{0ex}
\setlength{\bibnamesep}{0ex}
\setlength{\bibinitsep}{0ex}
\renewcommand\refname{\fontsize{10.5pt}{15.75pt}\selectfont \heiti{参考文献}\vspace{0.5ex}} % 设置参考文献标题格式

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%% 浮动体设置 %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 表格标题设置为楷体字
% \captionsetup[table]{textfont={bf,it}}
% 双语标题
\RequirePackage{bicaption}
\captionsetup[figure][bi-second]{name=Fig.,labelfont=small} %设置图的英文编号前缀
\captionsetup[table][bi-second]{name=Table} %设置表的英文编号前缀
\captionsetup[figure]{belowskip=-2ex,textfont=small,labelfont=small} % 设置图标题与下文之间的距离
\captionsetup[subfigure]{aboveskip=0ex,belowskip=0.5ex,textfont=small} % 设置子图标题与上文之间的距离
\newcommand{\figSkip}{-4ex}%双语标题与后文的距离


\makeatletter
\newcommand\titlename[1]{\def\@titlename{#1}}%报告名称
\newcommand\titlenameEng[1]{\def\@titlenameEng{#1}}%报告名称
\newcommand\stuname[1]{\def\@stuname{#1}}%姓名
\newcommand\stunameEng[1]{\def\@stunameEng{#1}}%姓名
\newcommand\stuID[1]{\def\@stuID{#1}}%学号
\newcommand\stuClass[1]{\def\@stuClass{#1}}%班级
\newcommand\stuIns[1]{\def\@stuIns{#1}}%机构
\newcommand\stuInsEng[1]{\def\@stuInsEng{#1}}%机构

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%% 页眉页脚设置 %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\hLength}{0.5em}
\fancypagestyle{headfootMain}{%正文页眉页脚
    % \clearpage
    \pagenumbering{arabic}  
    \setcounter{page}{2} % 重置页码计数器 
    \fancyhf{} % 清空默认的页眉和页脚
    \fancyhead[CO]{\liuhao\@stuname: \@titlename}%奇数页
    \fancyhead[RO]{\xiaowu y\thepage}%奇数页
    \fancyhead[LO]{\liuhao 第X期}%奇数页
    \fancyhead[CE]{\liuhao 西\hspace{\hLength}安\hspace{\hLength}交\hspace{\hLength}通\hspace{\hLength}大\hspace{\hLength}学\hspace{\hLength}学\hspace{\hLength}报}%偶数页
    \fancyhead[LE]{\xiaowu y\thepage}
    \fancyhead[RE]{\liuhao 第xx卷}
    \renewcommand{\headrule}{\hrule height 1pt}
    \renewcommand{\footrulewidth}{0pt}
}

\fancypagestyle{headfootBefore}{%正文之前部分页眉页脚（摘要，目录等）
    % \clearpage
    % \pagenumbering{Roman} 
    \setcounter{page}{1} % 显式设置页码为1
    \fancyhf{} % 清空默认的页眉和页脚
    \fancyhead[C]{西\hspace{\hLength}安\hspace{\hLength}交\hspace{\hLength}通\hspace{\hLength}大\hspace{\hLength}学\hspace{\hLength}学\hspace{\hLength}报\\
    JOURNAL OF XI'AN JIAOTONG UNIVERSITY}
    \fancyhead[L]{第X卷 \hspace{\hLength} 第xx期 \\ 2025年11月}
    \fancyhead[R]{Vol.X \hspace{\hLength} No.xx \\ Nov. 2025}
    \fancyfoot[L]{\zihao{-5}————————————

收稿日期：2025-xx-xx。作者简介：xxx

网络出版时间：\hphantom{\qquad\qquad}网络出版地址：}
    \renewcommand{\headrule}{\hrule height 1pt}
    \renewcommand{\footrulewidth}{0pt}
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%% 首页封面设置 %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\makeheader}{%首页封面
    % \centerline{\heiti\erhao \@titlename}
    \begin{minipage}[c]{\textwidth}
        \centering
        {\heiti\erhao \@titlename}

        {\fontsize{10pt}{10pt}\selectfont\quad} % 标题后的空行

        
        {\wuhao\@stuname$^{1}$}

        {\xiaowu\@stuIns}

        \xiaowu\quad % 机构后，摘要前的空行


    \end{minipage}
}

\newcommand{\makeheaderEng}{%首页封面
    \begin{minipage}[c]{\textwidth}
        \centering

        \xiaosan\quad\vspace{1em}  %空行

        {\xiaosan\textbf{\@titlenameEng}}

        {\fontsize{10pt}{10pt}\selectfont\quad}% 标题后与英文名字之间的空行
            
        {\wuhao\@stunameEng$^{1}$}

        \xiaowu\quad % 英文名字后，机构前的空行
            
        {\xiaowu\@stuInsEng}

        \xiaowu\quad

    \end{minipage}
}

\newcommand{\TheHead}[4]{%封面汇总
\pagestyle{headfootBefore}
\begin{strip}
\makeheader%中文标题

\zhAbstract{#1}{#2}

\makeheaderEng%英文标题

\enAbstract{#3}{#4}

\end{strip}
}
\makeatother
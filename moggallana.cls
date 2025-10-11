% 《墨甘兰语法》类文档
% 巴利语法文献译疏模板
% 请使用LuaLaTeX编译（支持缅甸文和巴利文排版）

% !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{moggallana} % 墨甘兰语法
\LoadClass[12pt]{dianjin} % 基于阿毗达摩点津类

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1. 文档元数据设置
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% PDF输出设置
\hypersetup{%
    bookmarksopen=true, % 展开书签
    bookmarksnumbered=true, % 显示书签编号
    bookmarksopenlevel=1, % 默认展开级别
    unicode=true, % Unicode支持
    % 链接样式设置
    breaklinks=true, % 链接自动换行
    colorlinks=true, % 彩色链接
    citecolor=black, % 引用颜色
    linkcolor=red, % 内部链接颜色
    % PDF文档属性
    pdftitle={墨甘兰语法}, % 文档标题
    pdfauthor={德升尊者}, % 作者信息
    pdfkeywords={巴利语法经典,墨甘兰,译疏}, % 关键词
    pdfstartview=Fit, % 初始视图
    pdfsubject={南传上座部佛教}, % 主题分类
}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. 文档结构与层次设置
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 文档层次定制（继承自dianjin但微调）
\ctexset{
    % 部（Part）级别设置 - 墨甘兰特色：使用中文数字
    part={
        name={第,品},           % 名称格式：第X品
        number=\chinese{part},  % 使用中文数字编号
        format={\huge\bfseries\centering\songti}, % 超大号粗体宋体居中
    },
    % 章（Chapter）级别设置  
    chapter={
        name={},                % 不显示"章"字
        number=\arabic{chapter},% 使用阿拉伯数字编号
        format={\huge\bfseries\centering\songti}, % 超大号粗体宋体居中
    },
    % 节（Section）级别设置
    section={
        name={}, % 格式：节号
        number=\arabic{section},   % 使用阿拉伯数字编号
        format={\Large\bfseries\centering\songti}, % 大号粗体宋体居中
    },
    % 小节（Subsection）级别设置
    subsection={
        name={}, % 格式：章号.节号.小节号
        number=\arabic{subsection}, % 使用阿拉伯数字编号
        format={\large\bfseries\songti}, % 较大号粗体宋体
    },
    % 小小节（Subsubsection）级别格式
    subsubsection={
        format={\large\bfseries\songti}, % 较大号粗体宋体
    },
    % 段落（Paragraph）级别格式
    paragraph={
        format={\normalsize\bfseries\songti}, % 正常大小粗体宋体
    },
    % 小段落（Subparagraph）级别格式
    subparagraph={
        format={\normalsize\bfseries\songti}, % 正常大小粗体宋体
    },
}

% 设置节级别的页眉标记
\renewcommand\sectionmark[1]{%
    \markright{\CTEXifname{\CTEXthesection}{}#1}}

% 设置标题编号深度（支持到subsection级别）
\setcounter{secnumdepth}{2}

% 页眉设置
\renewcommand\sectionmark[1]{% 
    \markright{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. 墨甘兰特定功能设置
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 基于 J.R. Bhaddacak 巴利语法著作排版模板的优化版本
% 设计理念：语义化、简洁化、用户友好

% ==================== 布局命令 ====================
\newcommand{\parstart}{\par\noindent}
\usepackage{setspace} % 行距
%\onehalfspacing % 设置全文为1.5倍行距

% ==================== 语义化文档结构命令 ====================
% 经文
\NewDocumentCommand{\sutta}{ m m m }{%
    \subsubsection{#2 \quad #3}\label{sut:#1}%
}

% 群组经文 - 使用方框标识且缩进
% 手动模拟 paragraph 样式
\NewDocumentCommand{\suttagana}{ m m m }{%
    \par\noindent{\normalfont\bfseries\hspace{2em}\fbox{#2} \quad #3}\label{sut:#1}%
    \par\nobreak\noindent\ignorespaces%
}

% 混入正文的群组经文 - 使用方框标识
\NewDocumentCommand{\suttagananormal}{ m m m }{%
    {\normalfont\bfseries\fbox{#2} \quad #3}\label{sut:#1}%
}

% 经文汉译
\NewDocumentCommand{\suttazh}{ m }{%
    \parstart\setlength{\parskip}{2mm}%
    \faLanguage[regular]\ #1%
}

% 经文注释
\NewDocumentCommand{\vutti}{ O{2} m }{%
    \parstart\setlength{\parskip}{#1mm}%
    \faAngleRight\ #2%
}

% 经文注释汉译
\NewDocumentCommand{\vuttizh}{ O{2} m }{%
    \parstart\setlength{\parskip}{#1mm}%
    \faLanguage\ #2%
}

% 实例
\NewDocumentCommand{\example}{ O{2} m }{%
    \parstart\setlength{\parskip}{#1mm}%
    $\triangleright$\ #2%
}

% 译疏
\NewDocumentCommand{\transnote}{ O{2} m }{%
    \parstart\setlength{\parskip}{#1mm}%
    \faLightbulb[regular]\ #2%
}

% 重要
\NewDocumentCommand{\important}{ m }{%
    \parstart\setlength{\parskip}{2mm}%
    \faExclamation\ #1%
}

% 经文链接命令
\newcommand{\suttalink}[2]{``\hyperref[sut:#1]{#2}''}

% ==================== 语形计算命令 ====================
% 自定义斜角删除线
\usepackage{tikz}
\usetikzlibrary{calc}

\newcommand{\mystrike}[1]{%
  \tikz[baseline=(a.base)]{
    \node[inner sep=0pt, outer sep=0pt] (a) {#1};
    % 计算对角线长度和角度
    \coordinate (sw) at (a.south west);
    \coordinate (ne) at (a.north east);
    \coordinate (nw) at (a.north west);
    \coordinate (se) at (a.south east);
    
    % 绘制45度对角线删除线（从左上到右下）
    \draw[red, line width=0.8pt] 
      ($(nw) + (-0.1em,0.1em)$) -- 
      ($(se) + (0.1em,-0.1em)$);
  }%
}

% 或者更精细的版本，带延长效果
\newcommand{\mystrikeextended}[1]{%
  \tikz[baseline=(a.base)]{
    \node[inner sep=0pt, outer sep=0pt] (a) {#1};
    % 计算扩展后的对角线端点
    \path (a.south west) -- (a.north east) 
      coordinate[pos=-0.1] (start) 
      coordinate[pos=1.1] (end);
    
    % 绘制45度对角线删除线，两端延长10%
    \draw[red, line width=0.8pt, line cap=round] 
      (start) -- (end);
  }%
}

% အာ​ဒေသ命令 - 使用延长版本
\newcommand{\adesa}[2]{\mystrikeextended{#1} $\rightarrow$ \texthl{#2}} % အာ​ဒေသ
\newcommand{\lopa}[1]{\mystrike{#1}} % 删除线效果
%\newcommand{\adesa}[2]{\palimm{#1} $\rightarrow$ \palimmbf{\texthl{#2}}} % အာ​ဒေသ

% 高亮命令
\newcommand{\texthl}[1]{\textcolor{blue}{#1}} % 蓝色高亮

% 巴利文示例环境
\newcommand{\palisample}[1]{%
    \begin{center}
    \large \itshape #1
    \end{center}
}

% 示例分隔符
\newcommand{\sampleor}[1][或者]{\\\textup{\normalsize #1}\\}

% 分隔线
\newcommand{\seprule}{%
    \begin{center}
    \rule{0.4\linewidth}{0.6pt}
    \end{center}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. 经文列表格式设置
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 经文列表环境设置
\usepackage{enumitem}
\newlist{suttalist}{enumerate}{1}
\setlist[suttalist,1]{
    left=0pt,
    labelwidth=3em,
    align=left,
    itemindent=0pt,
    labelsep=0.5em,
    parsep=2pt,
    topsep=6pt,
    partopsep=0pt,
    listparindent=0pt,
    label={\arabic*.},
    before={\raggedright},
    after={\vspace{0.5\baselineskip}}
}

% ==================== 经文列表条目命令 ====================

% 经文条目命令 - 用于创建带页码引用的经文列表
% 参数说明：
%   #1 = 经文编号（用于标签引用）
%   #2 = 条目标签内容
%   #3 = 经文内容
\NewDocumentCommand{\suttaitem}{ m m m }{%
    \item[#2] \quad #3 \hfill \pageref{sut:#1}\par\nobreak%
}

% 群组经文条目命令 - 使用方框标识且缩进，不带页码引用
% 参数说明：
%   #1 = 经文编号（用于标签引用）
%   #2 = 方框内的条目标签内容
%   #3 = 经文内容
\NewDocumentCommand{\suttaganaitem}{ m m m }{%
    \item[\hspace{2em}\fbox{#2}] \quad #3\par\nobreak%
}

% 多行经文条目命令 - 用于处理跨行的经文，带页码引用
% 参数说明：
%   #1 = 经文编号（用于标签引用）
%   #2 = 条目标签内容
%   #3 = 多行经文内容（支持\\换行）
\NewDocumentCommand{\suttaitemmulti}{ m m m }{%
    \item[#2] \quad \parbox[t]{\dimexpr\linewidth-4em}{#3}%
    \hfill \pageref{sut:#1}\par\nobreak%
}

% 多行群组经文条目命令 - 使用方框标识且缩进，支持多行文本，不带页码引用
% 参数说明：
%   #1 = 经文编号（用于标签引用）
%   #2 = 方框内的条目标签内容
%   #3 = 多行经文内容（支持\\换行）
\NewDocumentCommand{\suttaganaitemmulti}{ m m m }{%
    \item[\hspace{2em}\fbox{#2}] \quad 
    \parbox[t]{\dimexpr\linewidth-4em-\fboxsep-\fboxrule*2}{%
        \raggedright  % 设置左对齐，避免两端对齐产生的间距不均
        #3%           % 经文内容
    }%
    \par\nobreak%     % 防止条目间出现不适当的分页
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. 继承的功能说明
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 注：本类继承自dianjin类，包含以下功能：
% - 多语言支持（中文-巴利文-缅甸文）
% - 完整的注释系统（脚注、尾注、边注）
% - 术语管理系统
% - 巴利语法符号系统
% - 注疏结构命令系统
% - 专业排版设置

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 文档结束
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
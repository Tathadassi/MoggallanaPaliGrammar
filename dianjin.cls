% 《阿毗达摩点津》类文档
% 南传上座部佛教阿毗达摩文献译疏专业排版模板

% Version: 1.0 (2025)
% Author: 德升尊者  
% Description: 南传上座部佛教阿毗达摩文献译疏模板
% Features: 支持中文-巴利文-缅甸文混合排版、学术注释系统、术语管理等

% 重要编译说明：必须使用LuaLaTeX编译（因包含缅甸文字符，其他引擎会乱码）
% 文件编码：UTF-8
% !Mode:: "TeX:UTF-8"

\NeedsTeXFormat{LaTeX2e} % 声明所需的LaTeX版本
\ProvidesClass{dianjin}[2025/09/11 v1.0 阿毗达摩点津模板] % 定义类名：阿毗达摩点津
\LoadClass[12pt]{ctexbook} % 基于ctexbook类，12pt字号，支持中文排版

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 目录
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 1. PDF元数据与超链接设置
% 2. 文档结构与层次设置
% 3. 页面布局与版式设置
% 4. 字体与多语言支持
% 5. 功能宏包加载
% 6. 学术注释系统
%   6.1 注释系统概述
%   6.2 文献标识命令系统
%   6.3 语法解析命令系统
%   6.4 夹注系统
%   6.5 尾注系统
%   6.6 脚注系统
%   6.7 边注系统
% 7. 术语译名管理系统
% 8. 其余自定义设置
% 9. 备用设置

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1. PDF元数据与超链接设置
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage[colorlinks,linktocpage=true,plainpages=false,breaklinks=true,%
urlcolor=darkgray,citecolor=blue,linkcolor=darkgray,filecolor=teal]{hyperref} % 加载超链接宏包，支持PDF书签和交叉引用链接

% PDF文档属性和超链接样式配置
\hypersetup{%
    bookmarksopen=true, % 在PDF阅读器中默认展开书签
    bookmarksnumbered=true, % 书签显示章节编号
    bookmarksopenlevel=1, % 默认展开到一级标题
    unicode=true, % 启用Unicode支持，确保特殊字符正确显示
    % 链接样式设置
    breaklinks=true, % 允许链接文本自动换行
    colorlinks=true, % 使用彩色链接而非边框
    citecolor=black, % 文献引用链接颜色：黑色
    linkcolor=red, % 内部交叉引用链接颜色：红色
    % PDF文档元数据设置
    pdftitle={阿毗达摩点津}, % 文档标题
    pdfauthor={德升尊者}, % 作者信息
    pdfkeywords={巴利佛典,毗藏,义说,译疏}, % 搜索关键词
    pdfstartview=Fit, % 初始视图模式：适应页面
    pdfsubject={南传上座部佛教}, % 文档主题分类
}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. 文档结构与层次设置
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 使用ctexset配置中文文档的章节格式
\ctexset{
    % 品（Part）级别格式设置
    part={
        name={第,品}, % 名称格式：第X品（如"第一品"）
        number=\Roman{part}, % 使用大写罗马数字编号（I, II, III...）
        format={\huge\bfseries\centering\songti}, % 格式：超大号粗体宋体居中
    },
    % 章（Chapter）级别格式设置  
    chapter={
        name={}, % 不显示"章"字，仅显示数字
        number=\arabic{chapter}, % 使用阿拉伯数字编号（1, 2, 3...）
        format={\huge\bfseries\centering\songti}, % 格式：超大号粗体宋体居中
    },
    % 节（Section）级别格式设置
    section={
        name={\arabic{chapter}.,}, % 名称格式：章号.节号（如"1.1"）
        number=\arabic{section}, % 使用阿拉伯数字编号
        format={\Large\bfseries\centering\songti}, % 格式：大号粗体宋体居中
    },
    % 小节（Subsection）级别格式设置
    subsection={
        name={\arabic{chapter}.\arabic{section}.,}, % 名称格式：章号.节号.小节号（如"1.1.1"）
        number=\arabic{subsection}, % 使用阿拉伯数字编号
        format={\large\bfseries\songti}, % 格式：较大号粗体宋体（左对齐）
    },
    % 小小节（Subsubsection）级别格式设置
    subsubsection={
        format={\large\bfseries\songti}, % 格式：较大号粗体宋体
    },
    % 段落（Paragraph）级别格式设置
    paragraph={
        format={\normalsize\bfseries\songti}, % 格式：正常大小粗体宋体
    },
    % 小段落（Subparagraph）级别格式设置
    subparagraph={
        format={\normalsize\bfseries\songti}, % 格式：正常大小粗体宋体
    },
}

% 设置节级别的页眉标记：在页眉中显示节编号和节标题
\renewcommand\sectionmark[1]{%
    \markright{\CTEXifname{\CTEXthesection}{}#1}}

% 设置标题编号深度：支持到subsection级别（即1.1.1）
\setcounter{secnumdepth}{2}

% 页眉详细设置
\renewcommand\sectionmark[1]{% 
    \markright{\arabic{chapter}.\arabic{section}\quad #1}} % 右页眉格式：章号.节号 节标题

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. 页面布局与版式设置
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 3.1 页面布局设置 - 采用16开书籍标准尺寸
\usepackage[paperheight=260mm, paperwidth=185mm, % 页面尺寸：260mm × 185mm（16开）
            top=3cm, bottom=3cm, % 上下边距：3厘米
            outer=3cm, inner=3cm, % 内外边距：3厘米（对称布局）
            heightrounded, marginparsep=1cm]{geometry} % 高度圆整和旁注间隔1厘米

% 3.2 排版微调设置
\sloppy % 启用宽松对齐模式，避免过紧的字间距和溢出
%\fussy % 严格模式（注释状态），启用后右侧可能不齐，但间距更精确
%\usepackage{microtype} % 微排版调整（注释状态，定稿阶段使用）：改善字间距和断行

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. 字体与多语言支持
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 4.1 多语言支持设置
\usepackage{babel} % 加载babel宏包，用于多语言支持和连字符处理
\usepackage{fontspec} % 加载fontspec宏包，用于设置OpenType和TrueType字体

% 设置拉丁文字体
\setmainfont{TeX Gyre Schola} % 主字体：用于正文的衬线字体
\setsansfont{TeX Gyre Heros}[Scale=MatchLowercase] % 无衬线字体：用于标题等，缩放匹配小写字母高度
\setmonofont{DejaVu Sans Mono}[Scale=MatchLowercase] % 等宽字体：用于代码和计算机文本
\babelfont[latin]{rm}{TeX Gyre Schola} % 为拉丁语设置字体：TeX Gyre Schola

% 设置缅甸文字体
\babelfont[burmese]{rm}[Renderer=Harfbuzz]{NotoSansMyanmar} % 使用NotoSansMyanmar字体，启用Harfbuzz渲染器

% 定义巴利文专用字体
\newfontfamily{\palimmfont}[
    Renderer=Harfbuzz,
    Path=./Myanmar-Unicode-Fonts/,
    Extension=.ttf,
    UprightFont=Padauk,
    BoldFont=PadaukSgaw-bookbold
]{Padauk}

% 巴利文格式命令
\newcommand{\palimm}[1]{{\palimmfont #1}} % 细体缅文巴利
\newcommand{\palimmbf}[1]{{\palimmfont\bfseries #1}} % 粗体缅文巴利
\newcommand{\paliroman}[1]{\textit{#1}} % 斜体罗马巴利
\newcommand{\paliromanbf}[1]{\textit{\bfseries #1}} % 粗斜体罗马巴利

% 指定单词断字规则：为巴利文设置正确的断字点
\hyphenation{vi-bh-at-ti vi-bh-at-tis saṃ-saṭ-ṭhaṃ}

% 定义自动语言切换规则：基于字符ID自动检测并切换字体
\babelprovide[import, onchar=ids fonts]{burmese} % 导入缅甸语支持，自动检测缅甸文字符
\babelprovide[import, onchar=ids fonts]{latin} % 导入拉丁语支持，自动检测拉丁文字符

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. 功能宏包加载
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 5.1 基础功能宏包
\usepackage{pdfpages} % PDF文件插入支持：可插入外部PDF页面
\usepackage[hyperref]{xcolor} % 颜色支持：增强的颜色功能，特别优化与hyperref的兼容性
\usepackage{amsmath} % 数学公式排版：增强的数学公式支持
\usepackage{amssymb} % 数学符号
\usepackage{fontawesome5} % FontAwesome 图标
\usepackage{verbatim} % 注释环境：用于大段代码注释或忽略LaTeX代码
\usepackage{xspace} % 智能空格处理：命令后自动添加适当空格
\usepackage[autostyle]{csquotes} % 智能引号：根据语言自动选择引号样式
\usepackage{makeidx} % 索引生成支持：创建书籍索引
\usepackage{fancyhdr} % 页眉页脚定制：自定义页眉页脚样式
\usepackage{emptypage} % 空白页处理：章节开始的空白页无页眉页脚

% 5.2 表格相关宏包
\usepackage{diagbox} % 表格斜线分割：支持表格中的斜线单元格
\usepackage{multirow} % 表格行合并：支持跨多行的表格单元格
\usepackage{makecell} % 单元格拆分：支持单元格内换行和复杂格式
\usepackage{booktabs} % 专业表格线：提供高质量的表格横线
\usepackage{arydshln} % 虚线绘制：支持表格中的虚线
\usepackage{longtable} % 长表格：支持跨页的长表格
% 长表格续页提示：在长表格分页时显示继续提示
\newcommand{\ltblcontinuedbreak}[1]{%
	\multicolumn{#1}{r}{（转下页）}\\ % 右对齐的续页提示
}

% 5.3 列表与枚举宏包
\usepackage{enumitem} % 列表环境增强：自定义列表格式和间距
\AddEnumerateCounter{\chinese}{\chinese}{} % 添加中文编号支持：使用中文数字枚举

% 5.4 注释宏包
\usepackage{marginnote} % 边注支持：在页面边缘添加注释
\usepackage{postnotes} % 尾注支持：将注释收集在章节末尾

% 5.5 绘图宏包
\usepackage{tikz} % 矢量绘图：创建复杂的图表和图形
\usetikzlibrary{graphs} % 图论支持：绘制各种类型的图形
\usetikzlibrary{quotes} % 线条标签支持：在绘图中添加标签引线

% 5.6 文献与引用宏包
% 使用GB/T 7714-2015中文文献著录标准，作者-标题引用样式
\usepackage[backend=biber, % 使用biber后端（替代bibtex，支持Unicode）
            bibstyle=gb7714-2015, % 文献样式：中国国家标准GB/T 7714-2015
            citestyle=authortitle, % 引用样式：作者-标题格式
            gbnoauthor=true, % 国标无作者处理：当作者为空时的处理方式
            sorting=nyt]{biblatex} % 排序方式：按名称-年份-标题排序

% 5.7 交叉引用宏包
\usepackage{nameref} % 名称引用支持：通过标签名而非编号进行引用

% 5.8 多文件编译宏包（必须置于导言区最后）
\usepackage{subfiles} % 子文档支持：将大文档拆分为多个子文件
\usepackage[subpreambles=true]{standalone} % 独立文档编译：子文件可独立编译
\usepackage{import} % 文件导入支持：导入外部文件和代码

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6. 学术注释系统
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 6.1 注释系统概述
% 按内容分为四大层次：
% - 藏：三藏圣典原文及其译文
% - 说：义说原文及其译文
% - 解：解原文及其译文
% - 训：非注疏文献原文及其译文
%
% 按位置分为四大类型：
% - 夹注：行内简短注释
% - 尾注：章末详细注释（疏证）
% - 脚注：页面底部简要注释
% - 边注：页面边缘简短注释

% 6.2 文献标识命令系统
% 藏命令：三藏圣典标识
\DeclareDocumentCommand\zang{s m}
{%
    \IfBooleanTF{#1}
    {\textbf{\songti 藏}}% % 仅显示"藏"字（强调用途）
    {\textbf{\songti 藏：}\shengdian{#2}}% % 显示"藏："+圣典原文或译文
}

% 说命令：义说标识
\DeclareDocumentCommand\shuo{s m}
{%
    \IfBooleanTF{#1}
    {\textbf{\songti 说}}% % 仅显示"说"字（强调用途）
    {\textbf{\songti 说：}〈#2〉}% % 显示"说："+〈说〉注文或译文
}

% 解命令：解标识
\DeclareDocumentCommand\jie{s m}
{%
    \IfBooleanTF{#1}
    {\textbf{\songti 解}}% % 仅显示"解"字（强调用途）
    {\textbf{\songti 解：}〔#2〕}% % 显示"解："+〔解〕注文或译文
}

% 训命令：非注疏文献标识
\DeclareDocumentCommand\xun{s m}
{%
    \IfBooleanTF{#1}
    {\textbf{\songti 训}}% % 仅显示"训"字（强调用途）
    {\textbf{\songti 训：}［#2］}% % 显示"训："+［训］内容
}

% 其他相关命令
\newcommand{\shengdian}[1]{\textbf{\songti #1}} % 圣典文字格式：粗体宋体，用于强调经典原文
\newcommand{\lz}{\colorbox[gray]{0.85}{连缀}\space} % 连缀图标：灰色背景的"连缀"标签
\newcommand{\lianzhui}[1]{\footnote{\kaishu{\lz #1}}} % 连缀注释：带连缀图标的脚注
\newcommand{\niyam}{\colorbox[gray]{0.85}{定则}\space} % 定则图标：灰色背景的"定则"标签（巴利文နိယံ）
\newcommand{\shu}{\colorbox[gray]{0.85}{\textbf{\songti 疏}}\space} % 疏图标：灰色背景的粗体"疏"标签
\newcommand{\zheng}{\colorbox[gray]{0.85}{\textbf{\songti 证}}\space} % 证图标：灰色背景的粗体"证"标签

% 6.3 语法解析命令系统
% 巴利语法符号命令系统

% 质字命令（对钩符号）
\NewDocumentCommand\dhatu{m o}
{%
    \IfNoValueTF{#2}%
    {$\surd$\palimmbf{#1}}% % 无注释：仅显示√符号和文字
    {$\surd$\palimmbf{#1}\jiazhu[]{#2}}% % 有注释：显示√符号、文字和蓝色注释
}

% 形字命令（三角符号）
\NewDocumentCommand\linga{m o}
{%
    \IfNoValueTF{#2}%
    {$\triangle$\palimm{#1}}% % 无注释：仅显示△符号和文字
    {$\triangle$\palimm{#1}\jiazhu[]{#2}}% % 有注释：显示△符号、文字和蓝色注释
}

% 缘字命令（星号符号）
\NewDocumentCommand\paccaya{m o}
{%
    \IfNoValueTF{#2}%
    {\textasteriskcentered \palimmbf{#1}}% % 无注释：仅显示*符号和文字
    {\textasteriskcentered \palimmbf{#1}\jiazhu[]{#2}}% % 有注释：显示*符号、文字和蓝色注释
}

% 别字命令（@符号）
\NewDocumentCommand\vibhatti{m o}
{%
    \IfNoValueTF{#2}%
    {$@$\palimm{#1}}% % 无注释：仅显示@符号和文字
    {$@$\palimm{#1}\jiazhu[]{#2}}% % 有注释：显示@符号、文字和蓝色注释
}

% 词形命令（圈中点符号）：表示完整的词形
\NewDocumentCommand\pada{m o}
{%
    \IfNoValueTF{#2}%
    {$\odot$#1}% % 无注释：仅显示⊙符号和文字
    {$\odot$#1\jiazhu[]{#2}}% % 有注释：显示⊙符号、文字和蓝色注释
}

% ==================== 常规字形构成分析 ====================

% 基本去疑字分析（kitabasic）：△形字 = √质字 + *缘字
% 用法：\kita{形字}[形字义]{质字}[质字义]{缘字}[缘字义]
\NewDocumentCommand{\kitabasic}{m o m o m o}{%
    \linga{#1}% % 显示形字符号和文字
    \IfValueT{#2}{\jiazhu{#2}}% % 如果有形字注释则显示蓝色注释
    \ =\ \dhatu{#3}% % 等号后显示质字符号和文字
    \IfValueT{#4}{\jiazhu{#4}}% % 如果有质字注释则显示蓝色注释
    \ +\ \paccaya{#5}% % 加号后显示缘字符号和文字
    \IfValueT{#6}{\jiazhu{#6}}% % 如果有缘字注释则显示蓝色注释
}

% 完整去疑字分析（kitafull）
% 无星号：△结果形字 = △前形字 + √质字 + *缘字
% 用法：\kitafull{结果形字}[结果形字义]{前形字}[前形字义]{质字}[质字义]{缘字}[缘字义]
% 有星号：△结果形字 = √质字 + *缘字 + *缘字
% 用法：\kitafull*{形字}[形字义]{质字}[质字义]{次缘字}[次缘字义]{主缘字}[主缘字义]
\NewDocumentCommand{\kitafull}{s m o m o m o m o}{%
    \linga{#2}% % 显示结果形字符号和文字
    \IfValueT{#3}{\jiazhu{#3}}% % 如果有结果形字注释则显示蓝色注释
    \ =\ % % 显示等号
    \IfBooleanTF{#1}
    {% 有星号模式：△ = √ + * + *（两个缘字）
        \dhatu{#4}% % 显示质字符号和文字
        \IfValueT{#5}{\jiazhu{#5}}% % 如果有质字注释则显示蓝色注释
        \ +\ % % 显示加号
        \paccaya{#6}% % 显示次缘字符号和文字
        \IfValueT{#7}{\jiazhu{#7}}% % 如果有次缘字注释则显示蓝色注释
        \ +\ % % 显示加号
        \paccaya{#8}% % 显示主缘字符号和文字
        \IfValueT{#9}{\jiazhu{#9}}% % 如果有主缘字注释则显示蓝色注释
    }
    {% 无星号模式：△ = △ + √ + *（前形字+质字+缘字）
        \linga{#4}% % 显示前形字符号和文字
        \IfValueT{#5}{\jiazhu{#5}}% % 如果有前形字注释则显示蓝色注释
        \dhatu{#6}% % 显示质字符号和文字
        \IfValueT{#7}{\jiazhu{#7}}% % 如果有质字注释则显示蓝色注释
        \ +\ % % 显示加号
        \paccaya{#8}% % 显示缘字符号和文字
        \IfValueT{#9}{\jiazhu{#9}}% % 如果有缘字注释则显示蓝色注释
    }%
}

% 彼益字分析（taddhita）：△形字 = △形字 + *缘字
% 用法：\taddhita{结果形字}[结果形字义]{原形字}[原形字义]{缘字}[缘字义]
\NewDocumentCommand{\taddhita}{m o m o m o}{%
    \linga{#1}% % 显示结果形字符号和文字
    \IfValueT{#2}{\jiazhu{#2}}% % 如果有结果形字注释则显示蓝色注释
    \ =\ \linga{#3}% % 等号后显示原形字符号和文字
    \IfValueT{#4}{\jiazhu{#4}}% % 如果有原形字注释则显示蓝色注释
    \ +\ \paccaya{#5}% % 加号后显示缘字符号和文字
    \IfValueT{#6}{\jiazhu{#6}}% % 如果有缘字注释则显示蓝色注释
}

% 约合字分析（samasa）：△形字 = △形字 + △形字
% 用法：\samasa{约合形字}[约合形字义]{形字1}[形字1字义]{形字2}[形字2字义]
\NewDocumentCommand{\samasa}{m o m o m o}{%
    \linga{#1}% % 显示约合形字符号和文字
    \IfValueT{#2}{\jiazhu{#2}}% % 如果有约合形字注释则显示蓝色注释
    \ =\ \linga{#3}% % 等号后显示形字1符号和文字
    \IfValueT{#4}{\jiazhu{#4}}% % 如果有形字1注释则显示蓝色注释
    \ +\ \linga{#5}% % 加号后显示形字2符号和文字
    \IfValueT{#6}{\jiazhu{#6}}% % 如果有形字2注释则显示蓝色注释
}

% ==================== 常规词形构成分析 ====================

% 名词分析：⊙名词 = △形字 + @别字
% 用法：\namapada{名词}[名词义]{形字}[形字义]{别字}[别字义]
\NewDocumentCommand{\namapada}{m o m o m o}{%
    \pada{#1}% % 显示名词符号和文字
    \IfValueT{#2}{\jiazhu{#2}}% % 如果有名词注释则显示蓝色注释
    \ =\ \linga{#3}% % 等号后显示形字符号和文字
    \IfValueT{#4}{\jiazhu{#4}}% % 如果有形字注释则显示蓝色注释
    \ +\ \vibhatti{#5}% % 加号后显示别字符号和文字
    \IfValueT{#6}{\jiazhu{#6}}% % 如果有别字注释则显示蓝色注释
}

% 述词分析：⊙述词 = √质字 + *缘字 + @别字
% 用法：\akhyatapada{述词}[述词义]{质字}[质字义]{缘字}[缘字义]{别字}[别字义]
\NewDocumentCommand{\akhyatapada}{m o m o m o m o}{%
    \pada{#1}% % 显示述词符号和文字
    \IfValueT{#2}{\jiazhu{#2}}% % 如果有述词注释则显示蓝色注释
    \ =\ \dhatu{#3}% % 等号后显示质字符号和文字
    \IfValueT{#4}{\jiazhu{#4}}% % 如果有质字注释则显示蓝色注释
    \ +\ \paccaya{#5}% % 加号后显示缘字符号和文字
    \IfValueT{#6}{\jiazhu{#6}}% % 如果有缘字注释则显示蓝色注释
    \ +\ \vibhatti{#7}% % 加号后显示别字符号和文字
    \IfValueT{#8}{\jiazhu{#8}}% % 如果有别字注释则显示蓝色注释
}

% 非常规字形示例（注释状态，供参考）
%\linga{ဗုဒ္ဓ}[佛陀] = \dhatu{ဗုဓ}[知道] + \paccaya{ဏေ}[使] + \paccaya{တ}[能]
%\linga{ဝိစာရ} = \linga{ဝိ}\dhatu{စရ} + \paccaya{ဏ}

% 6.4 夹注系统设置 - 用于行内的简短注释
% 夹注命令：提供三种不同格式的行内简注
% 
% 【命令功能】
% 提供三种不同格式的行内简注，用于学术文献的多层次注释系统
%
% 【参数说明】
% s - 星号参数：控制注释格式类型
% o - 可选参数：用于区分〔解〕格式（任意值即可）
% m - 必选参数：注释文本内容
%
% 【三种格式及用途】
%
% 1. ［训］格式：非注疏文献内容注释
%    用法：\jiazhu{注释内容}
%    用途：用于标注非注疏文献
%    示例：佛陀\jiazhu{缅甸文文献内容}
%    显示：佛陀［缅甸文文献内容］
%
% 2. 〈说〉格式：义说内容注释  
%    用法：\jiazhu*{注释内容}
%    用途：用于标注义说
%    示例：四圣谛\jiazhu*{说注文}
%    显示：四圣谛〈说注文〉
%
% 3. 〔解〕格式：解内容注释
%    用法：\jiazhu*[任意值]{注释内容}
%    用途：用于标注解
%    示例：阿毗达摩\jiazhu*[1]{解注文}
%    显示：阿毗达摩〔解注文〕
%
% 【设计特点】
% - 蓝色小字：\textcolor{blue} 视觉上不喧宾夺主
% - 楷体字体：\kaishu 与传统注释风格一致  
% - 小号字号：\tiny 保持行内注释的紧凑性
% - 三种括号：［］〈〉〔〕提供清晰的视觉层次区分
%
\NewDocumentCommand\jiazhu{s o m}
{%
    \IfBooleanTF{#1}
    {% 有星号模式
        \IfNoValueTF{#2}%
        {{\tiny\textcolor{blue}{\mdseries{\kaishu 〈#3〉}}\normalsize}}% % 〈说〉格式：蓝色楷体小字
        {{\tiny\textcolor{blue}{\mdseries{\kaishu 〔#3〕}}\normalsize}}% % 〔解〕格式：蓝色楷体小字
    }%
    {{\tiny\textcolor{blue}{\mdseries{\kaishu ［#3］}}\normalsize}}% % ［训］格式：蓝色楷体小字
}

% 6.5 尾注系统设置 - 用于章末的详细注释（疏证）
\usepackage{enumitem} % 列表环境增强：用于自定义尾注列表格式
\newlist{postnotelist}{enumerate}{1} % 创建新的尾注列表环境
\setlist[postnotelist,1]{%
    labelwidth = 2em, % 标签宽度：2字符宽度
    itemindent = 0pt, % 项目缩进：无缩进
    labelindent = 0pt, % 标签缩进：无缩进
    labelsep = 0pt, % 标签分隔：无分隔
    leftmargin = !, % 左边界自动：自动计算左边距
    align = left % 对齐方式：左对齐
}

% 尾注格式详细设置
\postnotesetup{%
    listenv = postnotelist, % 使用自定义的尾注列表环境
    postprintnote = （第\pnthepage 页）, % 尾注后添加页码信息：（第X页）
    maketextmark = {#2\textbf{#1}~#3} % 尾注标记格式：文本 + 粗体编号 + 内容
}

% 尾注页眉格式设置
\postnotesetup{
    heading = {%
        \section*{\pntitle} % 尾注标题：无编号节标题
        \markboth{\mypnheaderleft}{\mypnheaderright}% % 双页页眉设置
    }, 
}

% 左页页眉内容定义：显示章号和章名
\ExplSyntaxOn
\NewDocumentCommand \mypnheaderleft {}
{
    \arabic{chapter}\quad \Chaptername % 格式：章号 + 章名（如"1 示心"）
}
\ExplSyntaxOff

% 右页页眉内容定义：显示"疏证"
\ExplSyntaxOn
\NewDocumentCommand \mypnheaderright {}
{
    \tl_if_eq:NNTF \pnhdpagefirst \pnhdpagelast
    {疏证} % 单页尾注：仅显示"疏证"
    {疏证} % 多页尾注：显示"疏证"
}
\ExplSyntaxOff

% 尾注编号设置：按章重置，每章重新从1开始编号
\counterwithin*{postnote}{chapter}

% 尾注编号格式：使用中文数字编号（〔一〕,〔二〕...）
\makeatletter
\renewcommand{\@makefnmark}{\makebox{\normalfont(\@thefnmark)\space}}
\makeatother
\renewcommand\thepostnote{〔\chinese{postnote}〕}

% 尾注标题设置："疏证"并添加到目录
\renewcommand*{\pntitle}{疏证\addcontentsline{toc}{section}{疏证}}

% 尾注疏证：添加到章节末尾的尾注
\newcommand{\weizhu}[1]{\postnote{\footnotesize\songti #1}}

% 疏表命令
\newcommand{\shubiao}{%
    \newpage
    \printpostnotes % 打印尾注（疏证部分）
    \newpage
    \section*{义表} % 义表标题：无编号节标题
    \markboth{\arabic{chapter}\quad\Chaptername}{义表} % 页眉设置：左页眉显示章信息，右页眉显示"义表"
    \addcontentsline{toc}{section}{义表} % 将"义表"添加到目录
}

% 6.6 脚注系统设置 - 用于页面底部的简要注释
\makeatletter
\renewcommand{\@makefnmark}{\textsuperscript{\makebox{\normalfont(\@thefnmark)\space}}}
\makeatother
\renewcommand\thefootnote{\arabic{footnote}} % 脚注编号：阿拉伯数字（1,2,3...）
%\usepackage[]{footmisc} % 脚注增强（注释状态）：提供更多脚注功能
\newcommand{\jiaozhu}[1]{\footnote{\kaishu{#1}}} % 脚注简注：楷体字脚注

% 6.7 边注系统设置 - 用于页面边缘的简短注释
%\renewcommand*{\marginfont}{\footnotesize} % 边注字体设置（可选）：小号字体
\newcommand{\yema}[1]{\marginnote{[#1]}} % 边注页码：在页面边缘显示页码引用

% 6.8 学术排版宏包
%\usepackage{ktbox}    % 加载结构化高亮框
%\usepackage{ktcolor}  % 加载语义色彩
%\usepackage{ktorcid}  % 加载ORCID工具

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 7. 术语译名管理系统
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage[abbreviations, record=only]{glossaries-extra} % 术语表宏包：创建和管理术语表，仅记录不显示

% 存储术语信息的宏
\newcommand{\storeterm}[3]{%
  \expandafter\def\csname term@#1\endcsname{#2}%
  \expandafter\def\csname term@#1@expl\endcsname{#3}%
}

% 获取术语信息的宏
\newcommand{\getterm}[1]{%
  \ifcsname term@#1\endcsname
    \csname term@#1\endcsname
  \else
    \empty% 如果没有找到，返回空
  \fi
}
\newcommand{\gettermexpl}[1]{%
  \ifcsname term@#1@expl\endcsname
    \csname term@#1@expl\endcsname
  \else
    % 如果没有阐释，返回空
  \fi
}

% 检查术语是否存在的宏
\newcommand{\iftermexists}[3]{%
  \ifcsname term@#1\endcsname
    #2% 存在时执行
  \else
    #3% 不存在时执行
  \fi
}

% 术语命令
\NewDocumentCommand{\newterm}{m m m o}{%
  % 存储术语信息
  \IfNoValueTF{#4}
    {\storeterm{#2}{#3}{}}% 无阐释
    {\storeterm{#2}{#3}{#4}}% 有阐释

  % 定义命令
  \NewDocumentCommand{#1}{s m}{%
    \IfBooleanTF{##1}% 检查是否有星号
      {\textbf{\textcolor{blue}{#3}}}% 有星号：蓝色粗体显示
      {#3}% 无星号：正常显示
  }%
  
  % 创建术语表条目
  \IfNoValueTF{#4}
    {\expandafter\newglossaryentry\expandafter{term@\detokenize{#1}}{%
        name={#3}, 
        description={\unexpanded{\textcolor{gray}{\scriptsize\textbf{原文：}}#2}}, 
        text={#3}
      }
    }
    {\expandafter\newglossaryentry\expandafter{term@\detokenize{#1}}{%
        name={#3}, 
        description={\unexpanded{\textcolor{gray}{\scriptsize\textbf{原文：}}#2\quad\textcolor{gray}{\scriptsize\textbf{简释：}}#4}}, 
        text={#3}
      }
    }
  \glsadd{term@\detokenize{#1}}
}

\renewcommand{\glsnamefont}[1]{\textbf{#1}}

% 加载阿毗达摩术语译名：从外部文件导入预定义的术语
% 语法：\newterm{命令名称}{原文}{中文译名}[可选阐释]
\input{text/term} % 术语译名文件（需用户提供）

% 译名命令
\NewDocumentCommand{\yiming}{s m o}{%
  \IfBooleanTF{#1}
    {% 有星号模式：彩色注释显示
      \IfNoValueTF{#3}
        {% 无可选参数
          \iftermexists{#2}
            {% 术语存在：显示中文译名+蓝色原文注释
              {\kaishu \getterm{#2}}{\scriptsize\textcolor{blue}{\palimmbf{(#2)}}}%
            }
            {\textcolor{blue}{#2}}% 术语不存在：显示蓝色原文
        }
        {% 有可选参数：显示提供的可选参数+蓝色原文注释
          {\kaishu #3}{\scriptsize\textcolor{blue}{\palimmbf{(#2)}}}%
        }%
    }
    {% 无星号模式：正常显示
      \IfNoValueTF{#3}
        {% 无可选参数
          \iftermexists{#2}
            {\getterm{#2}}% 术语存在：显示中文译名
            {% 术语不存在：仅显示蓝色原文
              {\small\textcolor{blue}{\palimmbf{#2}}}\normalsize%
            }%
        }
        {#3}% 有可选参数：显示提供的可选参数
    }%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 8. 其余自定义设置
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 8.1 文档结构命令
% 礼敬命令：显示巴利文和中文对照的礼敬三宝文
\newcommand{\namo}{
    \begin{center}
        \Large \textbf{\em 
%            န​မော တဿ ဘဂဝ​တော အရဟ​တော သမ္မာသမ္ဗုဒ္ဓဿ။}
            Na​mo tassa bhagava​to araha​to sammāsambuddhassa.}
%            \\礼敬那位帕格瓦、阿拉汉、正自觉者}
        \vspace{5ex}
    \end{center}
}

% 开始命令：生成目录和显示礼敬文
\newcommand{\kaishi}{%
    \etocsetnexttocdepth{2}\localtableofcontents% % 生成局部目录（显示到二级标题）
    \newpage\thispagestyle{plain}\namo% % 新页显示礼敬文，使用朴素页眉页脚
}

% 8.2 文献引用命令
% 缅文文献引用命令：支持有页码和无页码两种引用格式
\DeclareDocumentCommand\citemm{m o} 
{%
    \IfNoValueTF{#2}%
    {\citetitle{#1}။}% % 无页码引用：书名+缅甸文句号
    {\citetitle{#1}၊\space{#2}။}% % 有页码引用：书名+逗号+页码+句号
}

% 中文文献引用命令：支持有页码和无页码两种引用格式
\DeclareDocumentCommand\citezh{m o} 
{%
    \IfNoValueTF{#2}%
    {《{\songti\citetitle{#1}}》}% % 无页码引用：宋体书名加书名号
    {《{\songti\citetitle{#1}}》，{\kaishu{第{#2}页}}。}% % 有页码引用：书名+楷体页码信息
}

% 8.3 文本标记命令
\newcommand{\peyyala}[1]{$\cdots\cdots$} % 省略号：表示重复或省略的内容

% 8.4 自定义环境系统
% 经名环境：用于显示经典名称（居中特大字体）
\newenvironment{jingming}
{\begin{center}\LARGE} % 开始：居中，特大号字体
{\vspace{2ex}\end{center}} % 结束：添加额外垂直间距

% 结束语环境：用于章节结束语（居中中等斜体）
\newenvironment{jieshu}
{\begin{center}\mdseries\large\em} % 开始：居中，中等系列，大号，斜体
{\end{center}} % 结束

% 诵环境：用于诗歌排版（引用环境+居中）
\newenvironment{song}
{\begin{quote}\begin{center}} % 开始：引用环境+居中
{\end{center}\end{quote}} % 结束

% 8.5 章节名称获取系统
% 获取并存储章节名称供其他命令使用（如页眉显示）
\let\Chaptermark\chaptermark
\def\chaptermark#1{\def\Chaptername{#1}\Chaptermark{#1}}
\let\Sectionmark\sectionmark
\def\sectionmark#1{\def\Sectionname{#1}\Sectionmark{#1}}
\let\Subsectionmark\subsectionmark
\def\subsectionmark#1{\def\Subsectionname{#1}\Subsectionmark{#1}}

% 8.6 图表计数器格式
\renewcommand{\tablename}{[\arabic{chapter}]} % 表标题格式：[章号]
\renewcommand\thetable{表\arabic{table}} % 表编号格式：表1, 表2...
\renewcommand{\figurename}{[\arabic{chapter}]} % 图标题格式：[章号]
\renewcommand\thefigure{图\arabic{figure}} % 图编号格式：图1, 图2...

% 8.7 目录格式定制
\usepackage{tocloft} % 目录格式控制：自定义目录样式（必须在etoc前加载）
\usepackage{etoc} % 增强目录控制：提供更灵活的目录设置
\renewcommand{\cfttoctitlefont}{\hfill\huge\bfseries\songti} % 目录标题字体：居中、超大、粗体、宋体
\renewcommand{\cftaftertoctitle}{\hfill} % 目录标题后间距：确保标题居中

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 9. 备用设置
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 9.1 计数器设置
%\counterwithin{chapter}{part} % 章号随品号重置（备用设置，注释状态）
%\setcounter{tocdepth}{1} % 目录深度设置（备用设置，注释状态）

% 9.2 其他字体设置
% 设置缅甸文字体
%\IfFontExistsTF{./Myanmar-Unicode-Fonts/NotoSansMyanmar-Regular.ttf}{
%    % 如果项目目录中的字体存在
%    \babelfont[burmese]{rm}[
%        Renderer=Harfbuzz,
%        Path=./Myanmar-Unicode-Fonts/,
%        Extension=.ttf,
%        UprightFont=*-Regular,
%        BoldFont=NotoSansMyanmarUI-Regular,
%        BoldFeatures={FakeBold=0}
%    ]{NotoSansMyanmar}
%}{
%    % 备用方案：使用系统字体
%    \babelfont[burmese]{rm}[Renderer=Harfbuzz]{Padauk}
%}

% 使用更通用的字体处理梵语和印地语
% \defaultfontfeatures{Scale=MatchLowercase}
% \babelfont[sanskrit]{rm}[Renderer=Harfbuzz,
%     Extension=.ttf,
%     UprightFont=*-Regular,
%     BoldFont=*-Bold
% ]{NotoSansDevanagari}

% \babelfont[hindi]{rm}[Renderer=Harfbuzz,
%     Extension=.ttf,
%     UprightFont=*-Regular,
%     BoldFont=*-Bold
% ]{NotoSansDevanagari}

% 添加僧伽罗语支持
% \babelfont[sinhala]{rm}[Renderer=Harfbuzz,
%     Extension=.ttf,
%     UprightFont=*-Regular,
%     BoldFont=*-Bold
% ]{NotoSansSinhala}

% 备选方案：如果Noto字体也不可用，使用系统默认字体
% \IfFontExistsTF{NotoSansDevanagari-Regular.ttf}{
%     % 使用Noto字体
% }{
%     \babelfont[sanskrit]{rm}[Renderer=Harfbuzz]{}
%     \babelfont[hindi]{rm}[Renderer=Harfbuzz]{}
% }

% \IfFontExistsTF{NotoSansSinhala-Regular.ttf}{
%     % 使用Noto字体
% }{
%     \babelfont[sinhala]{rm}[Renderer=Harfbuzz]{}
% }

% 定义自动语言切换规则
% \babelprovide[import, onchar=ids fonts]{burmese}
% \babelprovide[import, onchar=ids fonts]{latin}
% \babelprovide[import, onchar=ids fonts]{sanskrit}
% \babelprovide[import, onchar=ids fonts]{hindi}
% \babelprovide[import, onchar=ids fonts]{sinhala}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 文档结束
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
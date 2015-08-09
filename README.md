臺灣大學碩博士論文 XeLaTeX 模版
==========


前言
----------

這個模版的前身是 [tzhuan](http://github.com/tzhuan) 的
[臺灣大學碩博士論文 XeLaTeX 模板](https://github.com/tzhuan/ntu-thesis)。
同時也整合了一些 [qcl](https://github.com/qcl) 針對
[qcl-master-thesis](https://github.com/qcl/qcl-master-thesis) 所做的修改。
其中，他也參考了 [台大碩博士論文LaTeX範本](https://code.google.com/p/ntu-thesis-latex-template/)。
最後則由 [shaform](https://github.com/shaform) 在撰寫論文期間又做了些許更動。


下載
----------
您可以直接 clone 這個 git repository。


環境設定
--------------
### Ubuntu 14.04

```bash
# 安裝 XeLaTex 及 PDFtk 及 curl
sudo apt-get install texlive texlive-xetex texlive-latex-recommended texlive-latex-extra texlive-bibtex-extra texlive-science texlive-humanities pdftk curl

# 安裝字形（標楷體、Times New Roman）
sudo mkdir -p /usr/share/fonts/truetype/win/ 
# 從 Windows 複製字體
sudo cp [WINDOWS]/Windows/Fonts/kaiu.ttf /usr/share/fonts/truetype/win/
sudo cp [WINDOWS]/Windows/Fonts/times*.ttf /usr/share/fonts/truetype/win/
fc-cache
# 檢查是否成功
fc-list | grep "times\|kaiu"

# 編譯
make

# 編譯送圖書館版本（加上浮水印、保全）
make ntulib
```

### Mac OS

* 安裝 [MacTEX](https://tug.org/mactex/)
* 安裝 [PDFtk](http://www.pdflabs.com/tools/pdftk-server/)
* 編譯
    * make
* 編譯送圖書館版本（加上浮水印、保全）
    * make ntulib

### Windows

* 留下字形檔案，下載 [Ubuntu](http://www.ubuntu.com/) 並安裝或找一台[蘋果電腦](http://www.apple.com/tw/mac/)。

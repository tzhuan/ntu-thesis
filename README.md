臺灣大學碩博士論文 XeLaTeX 模版
==========

前言
----------

這個模版的前身是 LaTeX+CJK 的模版，是從我的碩士論文擷取出來的。如果您還是想用 LaTeX + CJK，請參考[這篇文章](http://www.csie.ntu.edu.tw/~tzhuan/www/resources/ntu/)。

必要軟體及工具
----------

  * LaTeX 套件：請安裝包含 XeLaTeX 的套件，如 texlive、MikTeX 等。
  * 編輯器：由於我的樣版用 UTF-8 編碼，請使用支援 UTF-8 編碼的文字編輯器。
  * 中英文字型：臺灣大學規定要使用 Times New Roman 及楷書字體，請您自行準備。
  * 本模版：請點選右上方的 Tags，從裡面下載最新的版本。

檔案介紹
----------

您將這個模版解開來後，應該會看到這些檔案：

  * `ntuthesis.cls`: 這是最重要的檔案，未來如果改版，通常只要下載新版將這個檔案覆蓋即可。
  * `ntuvars.tex`: 設定您的個人資訊。
  * `thesis.tex`: 論文的主檔案。
  * 其它的 tex 檔、png 檔：作為範例使用。
  * `Makefile`：供 `make` 使用，如果您不知道 `make` 是什麼，您可以不管它。


確認
----------
首先請您編輯 `thesis.tex`，您應該會看到 `\setmainfont{Times New Roman}` 和 `\setCJKmainfont{標楷體}` 這兩行，請您將 `Tiems New Roman` 和 `標楷體` 換成您想使用的字型。您可以用 `fc-list` 這個指令來確認您想使用的字型是否有正確安裝在您的系統上。如果確認無誤，請可以試著編譯 `thesis.tex` 這個檔案。如果您是 UNIX 的使用者，您可以直接打 `make`； 若您使用 TeX 整合編輯器，請確定您使用 XeLaTeX 來編譯 `thesis.tex`。如果一切無誤，應該可以產生 `thesis.pdf`。您可以看看您的論文大概會長什麼樣子。

撰寫您的論文
----------
接著請您編輯 `ntuvars.tex`，將裡面的資訊改成您的論文資訊。這裡的指令有兩種，一種是只有一個參數的指令，請您直接設定正確的值，例如 `\day{25}` ；而另一種指令有兩個參數，請您依序填入 *英文值* 和 *中文值* ，如 `\author{English Name}{中文姓名}` 。

待 `ntuvars.tex` 編輯完畢，請您再試著編譯 `thesis.tex`。如果能順利產生 `thesis.pdf`，您已經可以開始撰寫您的論文了，祝您順利畢業！

樣版說明
----------
`ntuthesis.cls` 提供 `ntuthesis` 這個 `class`。`ntuthesis` 繼承自 `book`，所以所有 `book` 的參數 `ntuthesis` 都可以接受。例如您想帶入 `oneside`，則您可以修改 `thesis.tex` 的第一行：

    \documentclass[oneside]{ntuthesis}

`ntuthesis` 提供一個額外的參數： `phd`。預設的情況下樣版會產生碩士論文，如果您要撰寫博士論文，請記得帶入 `phd` 參數：

    \documentclass[phd]{ntuthesis}

`ntuthesis` 已經帶入 `a4paper` 和 `12pt` 這兩個參數了，您不需再額外指定。


[Tz-Huan Huang](http://www.csie.ntu.edu.tw/~tzhuan)

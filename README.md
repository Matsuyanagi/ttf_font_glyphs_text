## ttf font glyphs text

ttf ファイルに含まれるグリフの一覧テキストを作成する

### Prerequisites

- .ttf font files
- [fonttools\.exe](https://www.microsoft.com/en-us/typography/tools.aspx)
	- ttfdump.exe
- [UniteTTC](http://yozvox.web.fc2.com/556E697465545443.html)
	- ttc ファイルを分解して ttf ファイルを作成する
	 

### 手順

1. ttc ファイルは UniteTTC を利用して ttf ファイルに分解する。
~~~dos
> unitettc32 msgothic.ttc
~~~

2. ttfdump で cmap テーブルのみを出力する
	200MB 程度になる。
	テンポラリディレクトリに出力して、process.cmap.ttf.txt.rb で文字を抜き出す

~~~dos
ttfdump -tcmap msgothic001.ttf > %TEMP%/msgothic001.cmap.txt
ruby process.cmap.ttf.txt.rb %TEMP%/msgothic001.cmap.txt > msgothic.moji.list.txt
~~~

~~~dos
ttfdump -tcmap meiryo001.ttf > %TEMP%/meiryo001.cmap.txt
ruby process.cmap.ttf.txt.rb %TEMP%/meiryo001.cmap.txt > meiryo.moji.list.txt
~~~

Segoe UI seguiemj.ttf は Windows でのカラー絵文字をサポートしたフォント
~~~dos
ttfdump -tcmap seguiemj.ttf > %TEMP%/seguiemj.cmap.txt
ruby process.cmap.ttf.txt.rb %TEMP%/seguiemj.cmap.txt > seguiemj.moji.list.txt
~~~

~~~dos
ttfdump -tcmap seguisym.ttf > %TEMP%/seguisym.cmap.txt
ruby process.cmap.ttf.txt.rb %TEMP%/seguisym.cmap.txt > seguisym.moji.list.txt
~~~

### 参考資料

[Character/Glyph Index Mapping](https://www.microsoft.com/typography/otspec/cmap.htm)
| platform ID | Encoding ID | Description                    |
|-------------|-------------|--------------------------------|
|           3 |          10 | Windows platform Unicode UCS-4 |


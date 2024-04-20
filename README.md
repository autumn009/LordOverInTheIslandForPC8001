# LORD OVER IN THE ISLAND for NEC PC-8001
2024/04/20 川俣 晶

![Title Image](/images/1.png)

## 概要
![Title Image](/images/4.jpg)

　LORD OVER IN THE ISLANDは、一つの島の覇権を5つの国で争うSLGで、プレイヤー数は1〜5人です。人が担当しない国はコンピュータ思考が担当します。
　このゲームは、月刊ASCII 1982年8月号に掲載されたLORD OVERのアイデアを元に、新規開発したゲームです。

　もともと、LORD OVERはFM-8/PC-8801用だったのでPC-8001所有者の筆者には遊べなかったので、独自に作成しました。作成に当たって、兵士の数を数値として扱い、それにより国盗り物語を行うSLG、というアイデアのみを参考にし、マップ及びプログラムは全て新規作成しました。

## 御注意
　本プログラムは全て川俣による新規書き下ろしです。起動するとASCII Presentsの文字が出てきますが、ASCIIは全く関与していません。アイデアを利用したことで、ASCIIの名前を尊重して記載したものです。特にそれ以上に関係はありません。(雑誌に掲載されたアイデアを参考にしただけです)

　ですが、歴史的なオリジナルを尊重して、ASCIIの文字はプログラム中にそのまま残してあります。

　けして、ASCII(KADOKAWA)にお問い合わせなどはなさらないようにお願いします。

## ファイル説明
　2バージョンが現存します。

- lord.cmt/lord.bas Ver 1.8 (Oct.29,1983)
- lord2.cmt/lord2.bas Ver 2.001 (Feb.11,1985)

　Ver 2.001の使用を推奨しますが、念のためVer 1.8も公開してあります。

## 実行環境
- NEC PC-8001シリーズまたはPC-8801シリーズ (N-BASICモード) 実機またはエミュレータ
- メモリ32KB以上
- エミュレータの場合はcmtファイルを読み込めるエミュレーション環境(j80など)
- 実機の場合はcmtファイルを実機に読み込ませる何らかの仕組み
- ROM BASIC/Disk BASICモード (Ver 1.8はDisk BASICで実行するとメモリ不足になります。RAM40KBモードならDisk BASICでも足りると思われます。Ver 2.001はCLEAR文で確保する文字列領域が小さいためどちらでも動作します。動作しないときはHow Many Files?の値を小さくしてみてください)

※ 全てN-BASICで書かれています。マシン語は使用していませんが、POKEとOUTは使用しています。

## 実行方法
- システムを念のためにリセットする。
- 以下のコマンドでメモリに読み込む。
cload "lord2" (lord2.basの場合)
cload "lord" (lord.basの場合)
- その後、runコマンドで実行する。
- RETURNキーで先に進める
- 人間のプレイヤーの人数を質問されるので、1〜5の数字を入力する。

![Title Image](/images/2.png)

## ゲームのルール
- 全ての国を征服し島を統一することがゲームの目標となります
- ゲームに登場する国はハート、ダイヤ、スペード、クラブ、丸の5つです。プレイヤー1名の場合、プレイヤーはハート国を担当します。残りはコンピュータが担当します。
- イエスノーで答える問いかけにはyまたはnキーで答えます。RETURNは不要です。yまたはnを押さずにRETURNを押すとその文脈でのデフォルト値が入ります
- 人数やエリア番号を指定する場合は数字を入力して最後にRETURNを押します
- これ以上移動させる兵隊がない場合などもRETURNを押します
- 兵士は人数でのみ管理され、戦闘力や経験値のようなパラメータはありません
- 兵士は(給料の払える範囲で)好きなだけ雇用することができます
- 兵士は好きなだけ解雇することができます
- 兵士には毎ターン給料を払わねばなりません
- 毎ターン、占領した土地に応じて税収が入ります。税収の詳細は後で述べる地形データ表を参照
- 移動は移動元のエリア番号、移動先のエリア番号、人数を入力します。移動は隣接したエリアにのみ可能です。
- 占領地の兵士の人数は最低でも1になります (全員を移動させることはできません)
- 移動先に敵がいる場合は戦闘になります。基本的に人数が多い方が勝ちますが、乱数と地形効果によって結果は変化します。防御力が2の地形の土地に攻め込む場合は、おおむね敵の2倍以上の人数を必要とします。
- 王様のいる場所はKマークで示されます。王様は移動できます。兵士の雇用は王様のいる場所の兵士数を増加させます。
- ランダムでイベントが発生し、特定のエリアが寝返って所有権が移転したり、怪物が出現して兵士が減ったりします。

## 地形データ表
　全てのエリアには番号とアルファベット1文字の地形を示す文字が割り当てられています。地形によって、防御に適した場所と、税収の多い場所があります。税収の多い土地を占領し、防御力の大きい土地に少人数を配置して守るのがプレイの基本です。

|記号|英語名称|日本語名称|地形防御|徴収可能税金|
|----|----|----|----|----|
|C|castle|城|5|1|
|T|town|街|1|7|
|A|aglicu(Agriculture)|農地|2|5|
|D|desart|荒れ地|1|1|
|W|woods|森|3|3|
|M|mountai(mountain)|山|4|2|

![Title Image](/images/3.png)

## プレイのコツ
- 収入の多い街と農地を優先的に占領し、防御力の高い森と山で防衛戦を構築して資金を蓄えるのが基本戦略です。
- 隣接するエリア(移動可能な移動先)が少ないエリアと多いエリアがあります。たとえば、13から行けるのは14だけですが、20からは11,17,19,21,24,26,27に行けます。行けるエリアが多い場所に陣取ると手薄な場所を攻めやすくなります。
- 特に20番はマップのほぼ中央にあって防御力が高くどこにでも攻めていける戦略上最重要のエリアです。ここの攻防がゲームの天王山と言っても過言ではないでしょう。
- 14番は収入の多い街ですが街そのものに防御力がなく、また周囲が農地であり、防御に適していない地形です。守り方を工夫してみましょう。
- 29番も街ですが、となりの24番が防御力皆無の砂漠なので、これも守りにくい地形です。守り方を工夫してみましょう。
- 18番の城は、攻め込むルートが30番しかなく、しかも30番が堅固な山なので攻め落とすのは最難関の城になります
- 逆に13番の城は隣接エリアが14番しかなく、14番は防御力のない街なので、守るのが最も難しい城となります。13番は人間プレイヤーが必ず担当します。

## ソースコードについての御注意
　ソースコードはシフトJISで開くとアルファベットとカナは閲覧できますが、グラフィックキャラクターは全て化けます。UTF-8で開くとカナも化けます。普通の方法で全ての文字を見ることはできないことに注意してください。完全なソースコードは実機またはエミュレータに読み込んでlistコマンドで見てください。

　ソースコード中のAkira KitaおよびAkiは当時の川俣のペンネームです。

This program was created by Akira Kawamata in 1982-1985.

This program is distributed under the terms of the MIT License.

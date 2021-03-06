=begin

= 「プログラミングのための確率統計」(オーム社, 2009) 章末コラム用スクリプト

サポートページ
http://ssl.ohmsha.co.jp/cgi-bin/menu.cgi?ISBN=978-4-274-06775-4

== ■ 準備

* Linux, Mac の場合: 準備不要. だめなら↓
* その他 UNIX 系の場合:
  * Ruby がもし入っていなければインストールする
  * /usr/bin/ruby がもしなければ, (root 権限で) 以下を行う.
    たとえば ruby が /usr/local/bin/ に置かれているなら,
      ln -s /usr/local/bin/ruby /usr/bin/
* Windows の場合:
  * Ruby をインストールする
  * 非公式サポートページもご参考に
    http://wiki.fdiary.net/lacs/?PSCS.Windows

Ruby のインストールについては http://www.ruby-lang.org/ja/ を参照.
手元ではバージョン 1.8.7 で動作確認しています.

== ■ 使い方

シミュレーションを実行するには:
各サブディレクトリで「make」や「make long」

パラメータを変えるには:
「make」や「make long」で表示されるコマンドを直打ちしてお好みに修正

各スクリプトのヘルプを見るには:
「ruby histogram.rb -h」のように -h オプションをつけて起動

== ■ 各サブディレクトリの説明

==== ◆ accident

(1)
「事故は続けておこる」と言われます.
これは, 「事故が一度起きると, その後しばらくは事故の
確率が高まる」ことを意味しているでしょうか? …… [ア]

簡単なシミュレーションで検証してみましょう.
「make」で表示される系列中の o が事故発生を表します.
結果を見ると, o の配置は均一ではなく,
妙に接近したかたまりや妙に長い空白期間が目にとまります.

系列の下に表示されているのは, 「o どうしの間隔」
(前の事故から何日後に次の事故が起きたか)のヒストグラムです.
これを見ても, 短い間隔で o が出ることが確かに多いとわかります. …… [イ]

しかし実はこの系列は, 「確率 0.1 で『o』, 確率 0.9 で『.』を書く」という
処理を単純にくり返しただけのものです.
各文字が「o」になるか「.」になるかは全く独立で, 確率も一定.
ですから, [イ] が必ずしも [ア] を意味するわけではありません.

「make long」では, より長い系列でのシミュレーション結果が表示されます.

(2)
「o どうしの間隔」の期待値について, 次のように二つの異なる説が考えられます.
どちらを支持しますか? 支持しなかった説のどこが誤りか指摘できますか?

[説 A]
t 文字目が o だったとしよう. 次に o が出るのが k 文字後となる確率は,
「. が (k-1) 回出てその次に o が出る」の確率だから
  (0.9 の (k-1) 乗) × 0.1
だ. この分布の期待値を計算すると, 答は 10. (計算過程は省略)

[説 B]
t 文字目と (t+1) 文字目とのさかいめに立って考えよう.
「次に o が出るのは何文字後か」の期待値は, 説 A のように 10 と求まる.
一方, 「直前に o が出たのは何文字前か」の期待値も, やはり同じ理屈で 10 となる.
だから, o から o までの間隔の期待値は 10 + 10 - 1 = 19 だ.
(この実験では「oo」を間隔 1, 「o.o」を間隔 2, 「o..o」を間隔 3 と数えるので,
上式には「- 1」がついています)

※ 下記を参考にさせていただきました.
  David MacKay: Information Theory, Inference and Learning Algorithms,
  Cambridge University Press, 2003.

==== ◆ cake

(1)
円いケーキを兄弟 2 人で分けます.
お兄さんはケーキの 12 時の位置にフォークをさし, こう言いました.
「中心から全くでたらめな方向にナイフを二回入れて, ケーキを二つに分ける.
フォークのある方がおれの, 残った方がおまえのだ」
これは公平でしょうか?

「make」で, シミュレーションの結果が表示されます.
最初に表示される数字の列は, 各回のシミュレーションで弟がもらった分け前です
（ケーキ全体を 1 としての割合）.
その下には, 分け前の割合のヒストグラムが表示されます.

「make long」では, 試行回数を増やした結果が表示されます.

※ 下記を参考にさせていただきました.
  「黄金のフラフープ」
  http://blog.beetama.com/blog-entry-557.html

(2)
長いロールケーキを, 一郎, 二郎, …, 五郎の 5 人で分けます.
全くでたらめに (前にどこを切ったかも見ずに) ナイフを 4 回入れて
ロールケーキを輪切りにし, 左から順に
一郎, 二郎, …, 五郎がもらうことにしました.
これは公平でしょうか?

「make roll」で, シミュレーションの結果が表示されます.
上に表示されるのが一郎の分け前のヒストグラム,
下に表示されるのが三郎の分け前のヒストグラムです.

「make rlong」では, 試行回数を増やした結果が表示されます.
どうやら公平そうですが, 公平な理由を数式なしで説明できますか?

==== ◆ monty

有名なモンティ・ホール問題です.
どんな問題かは web で検索すればすぐみつかります.
(たとえば下記)
  http://wiki.fdiary.net/lacs/?Pr.Def.2

「make」で表示されるのは, 最初の選択を貫いた場合の勝率と,
扉を選び直した場合の勝率です.
この結果を見ると, 選び直す方がたしかに勝率が高くなっています.

==== ◆ nearest

一辺の長さが 1 の d 次元立方体を舞台として,
その中に 100 個の点を独立な一様分布でランダムに打ちます.
最初に打った点 X(1) から, 残りの点 X(2), ..., X(100) までの
最短距離 R = min ||X(j) - X(1)|| (j = 2, ..., 100) は
どれくらいになるでしょうか.

「make run1」で d = 1 次元(つまり線分)の場合が,
「make run2」で d = 2 次元(つまり正方形)の場合が,
「make run3」で d = 3 次元(つまり立方体)の場合が, それぞれシミュレートされます.
表示されるのは, 同じ実験を何度かくり返し行ったときの R のヒストグラムです.

さらに, 「make run」で d = 20 次元の場合がシミュレートされます.
イメージよりもずいぶん大きな値だと感じるのではないでしょうか
(示されているのが最短距離だということをお忘れなく).

「make long」だと, 試行回数を増やした結果が表示されます.

次元が増えるにつれて点がまばらになるというこの結果は,
次元の呪いと呼ばれる現象の一例であり,
高次元データの解析・予測・パターン認識などの際にやっかいな問題となります.

==== ◆ pattern

(1)
「0001110101…」のように, ランダムに(確率半々で) 0 か 1 かを書き連ねていき,
指定されたパターンが出るまでの長さを数えます.
たとえば, 指定パターンが 1101 だったら, 系列の末尾が「…1101」となった時点で
打ち切り, そこまでの長さを数えます.
パターンによって, この長さの期待値は変わるでしょうか?

「make」では, 指定パターンが 01 の場合と 11 の場合をシミュレーションします.
「make long」は, より試行回数を増やしたシミュレーションを行い,
「そのパターンが出るまでにかかった長さ」のヒストグラムを表示します.
パターン 11 の方が出現までに長くかかりがちですが, 理由を説明できますか?

(2)
また, 「make count」では, 指定されたパターンが, 一定の長さまでに
何回出てきたかを数えます.
「make clong」は, 出現回数のヒストグラムを表示します.
この出現回数の平均は, パターン 01 でもパターン 11 でもほぼ同じになりました.
上の結果と一見矛盾するようですが, どう説明しますか?

※ 下記を参考にさせていただきました.
  ・G. ブロム, 他: 確率論へようこそ, シュプリンガーフェアラーク東京, 2005.
    第 14 章「パターン」
  ・「コインで遊ぶ」
    http://blog.beetama.com/blog-entry-618.html

==== ◆ portfolio

確率 0.7 で「ア」が出て, 確率 0.3 で「イ」が出るというくじがあります.
アかイかどちらに賭けても, 当たったら賭金が 2 倍になります.
したがって, アに賭ける方が明らかにお得です.

あなたは毎日, 全財産をこのくじに賭けます.
具体的には, 全財産のうち比率 p をアに, 残りの比率 (1-p) をイに賭けます.
p は前もって決めておきます.
これをずっとくり返すとしたら, p をどんな値にするのが良いでしょうか?

一日のもうけの期待値を考えると, p = 1 (全財産をアへ)が明らかに最適.
しかし, そんなギャンブルをくり返していたら, いずれは外れて一文無しに
なってしまうでしょう.

「make」で表示されるのは, p = 0.99 の場合と p = 0.7 の場合の
シミュレーション結果です.
「一定日数まで上のような賭けを行い, 財産が何倍になったか」という
実験を何度かやって, そのヒストグラムを表示しています.
ただし, そのままだと桁が広がりすぎるので, 何倍になったかの常用対数を
とりました.
「-1<=」は 0.1 倍以上 1 倍未満, 「0<=」は 1 倍以上 10 倍未満,
「1<=」は 10 倍以上 100 倍未満, 「2<=」は 100 倍以上 1000 倍未満, 
という具合.

この結果を見ると, 一番もうかるくじにばかり集中するのでなく,
その裏目へも適度に投資を分散した方がよさそうです.

==== ◆ sugoroku

すごろくゲームですが, あなたはプレイヤーではなく胴元です.
無限に長い一本道のすごろくがあり, どこか好きなマス目に
あなたはあらかじめ落し穴をしかけておきます.
プレイヤーが落し穴に止まったらあなたの勝ち.
すべての落し穴を越えられたらあなたの負け.

まずは落し穴が一個の場合, どこにしかけるのがよいでしょうか?
「make」では, 落し穴の場所を変えてみて, 勝率がどうなったかを表示します
(O があなたの勝ち、X があなたの負け).
「make long」だと, もっと試行回数を増やしてシミュレーションします.
表示されるコマンドを直打ちして「t=」のところを変えれば,
好きなところに落し穴をしかけられますから, いろいろな場所を試してください.

また, 落し穴が二個だとどうでしょう?
「make two」でいくつかの場合がシミュレーションできます.
「make tlong」だと, もっと試行回数を増やしてシミュレーションします.
どこへどれくらい離してしかけるのが良いか, こちらもいろいろ試してください.

さらに, 三個や四個だと?

※ 下記を参考にさせていただきました.
  「xe-kdoo(2007-03-23) すごろくで一番止まりやすいマスは？」
  http://yowaken.dip.jp/tdiary/20070323.html

==== ◆ tomoe

ともえ戦のシミュレーションをします.
ともえ戦とは, A, B, C の三人から次のようにして優勝者を決める方式のことです.
* まず A と B で戦う → A が勝った
* 勝者 A が, 待機していた C と戦う → C が勝った
* 勝者 C が, 待機していた B と戦う → B が勝った
* 勝者 B が, 待機していた A と戦う → A が勝った
* 勝者 A が, 待機していた C と戦う → A が勝った …… 連勝したので A が優勝
こんなふうに「負けたら交代」でぐるぐる戦い続けて, 誰かが連勝したら
その人が優勝となります.

ともえ戦は, 順番により有利不利があることが知られています.
「make」で最初に表示されるのは,
「誰と誰が戦っても勝敗の確率は五分五分」という設定での各人の優勝率です.
その次の表示は, 下記のような設定(C が少し強い)での結果です.
* A が B に勝つ確率は 50%
* B が C に勝つ確率は 45%
* C が A に勝つ確率は 55%
そこから下は, C をさらにだんだん強くしています.
C がはっきり強い設定でも, 優勝率はなかなか上がらないものですね.

「make long」だと, もっと試行回数を増やした結果が表示されます.

== ■ ヒント

Hint.txt に一言だけヒントを書きました. 自分で考えたい方は読まないでください.

== ■ 更新履歴

* [2009-10-14] 非公式サポートページ を追加.
* [2009-10-05] サポートページ を追加.
* [2009-09-22] beetama の URL を更新.
* [2009-07-30] 次郎 → 二郎
* [2009-07-15] 「準備」を追加.
* [2009-07-11] win 用に */make.bat を追加. (thx > 堀玄さん)

=end

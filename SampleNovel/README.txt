===================================================================
　　　　SampleNovelGame 

　　　　作者　ゼロニー
　　　　掲載URL　https://shu-ren.fc2.net/blog-entry-5.html
===================================================================
【概要】

　ノベルゲームのサンプルです。

　「かちかちやまSecond Story…」

　～あらすじ～
　おばあさんを食べたせいで爺さんとうさぎに袋叩きにあったたぬきが、
　精神状態が不安定なままカップラーメンを買いにスーパーマーケットを目指します。
　果たしてたぬきは無事カップラーメンを手に入れ、家に帰ることができるのでしょうか……。

　◆操作方法
　・左クリックで進行します。右クリックでメニューを表示/非表示できます。

　◆サンプルの概要
　・ロゴ画面/タイトル画面/シーン遷移
　・テキストエンジンの搭載：
　　└シナリオファイルの読み込みと解析
　　└画面全体にテキスト表示
　　└ボタン入力待ちアイコンをbbcodeで実装
　　└1文字単位のテキスト処理
　　└ラベルジャンプ
　・選択肢
　・文字速度、文字表示位置、立ち絵などの演出
　・フラグ判定によるマルチエンディング
　・BGMの再生
　・右クリックメニュー搭載
　　└バックログ機能
　　└テキスト表示速度調整
　　└複数の解像度
　　└ゲームのセーブ/ロード機能

------------------------------------------------------------------ 
【実行環境】

・バージョン：Godot4.3.dev6
・OS　　　　：Windows 10 64-bit
・CPU　 　　：AMD Ryzen 5 5600X 6-Core Processor
・メモリ　　：16GB
・GPU　 　　：AMD Radeon RX 6600
------------------------------------------------------------------ 
【サポート】

　誤記、バグなど発見しましたらこちらのコメント欄にでもどうぞ。
　https://shu-ren.fc2.net/blog-entry-5.html
------------------------------------------------------------------ 
【免責事項】

　本サンプルデータ(フォントを除く、プログラム、画像、サウンド等含む全て)の著作権は
　リッキーが保持しておりますが二次利用は可能とします。
　ゲーム制作等にご利用ください。
　ただし如何なる損害に対しても作者はその保障義務を一切負わないものとします。

【ライセンス】

【Godot Engine】
This game uses Godot Engine, available under the following license:

Copyright (c) 2014-present Godot Engine contributors. Copyright (c) 2007-2014 Juan Linietsky, Ariel Manzur.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
documentation files (the "Software"), to deal in the Software without restriction, including without limitation
the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

　The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

　THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

【FreeType】
Portions of this software are copyright © 2022 The FreeType Project (www.freetype.org). All rights reserved.

【ENet】
Copyright (c) 2002-2020 Lee Salzman

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
documentation files (the "Software"), to deal in the Software without restriction, including without limitation
the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO
THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

【mbed TLS】
Copyright The Mbed TLS Contributors

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on
an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the
specific language governing permissions and limitations under the License.

　フォントに「PixelMplus10-Regular」を使用しております。
------------------------------------------------------------------ 
【更新履歴】
2020/11/3　Ver1.0
　・最初のリリース。

2020/12/17　Ver1.01
　以下を追加。
　・画面全体にテキスト表示
　・選択肢でのシナリオ分岐
　・文字速度、文字表示位置、立ち絵など演出処理
　・フラグ判定によるマルチエンディング

2022/2/2　Ver2.00
　・右クリックメニュー搭載：バックログ機能、テキスト表示速度調整、複数の解像度に対応
　・シナリオテキスト改修：ラベルジャンプに対応
　・ボタン入力待ちアイコンをbbcodeで実装
　・一部画像修正
　・ゲーム進行のバグを修正

2024/05/07　Ver3.00
　・Godot4.3対応に伴い、スクリプトの修正と最適化
　・セーブ/ロード機能の追加
　・解説の追加

2024/07/11　Ver3.1
　・Godot4.3.beta3に対応

------------------------------------------------------------------ 
【解説】
------------------------------------------------------------------ 
サンプルゲームとは言え、独自にスクリプトエンジンを作成したせいもあって、
少しわかりにくいものになってしまった。
もう少し無駄を省けると思うが難しい。
解説も今後修正すると思う。

◆全般
Godotエディターの、
「プロジェクト > ユーザーデータフォルダーを開く」　から、
ゲームのセーブデータとサムネイルが入っているフォルダを開ける。
セーブデータを消すときはsavegame1.dataやsave_ss1.pngを消すと良い。
その他シェーダーキャッシュやログファイルも保存されている。
「user://～」から始まるファイルは読み書き可能なファイルでこのフォルダに保存されている。
「res://～」から始まるファイルは読み取り専用である。ファイルシステムに入っているファイルがそれである。

◆Global.tscn
@onready var backlog := get_tree().get_first_node_in_group(&"backlog")
@onready var gamemenu = get_tree().get_first_node_in_group(&"game_menu")
グループで検索したノードを「@onready」で格納することもできる。

mesという配列にPackedStringArray型を割り当てている。
文字列を扱う巨大な配列でも高いパフォーマンスを維持できるそうであるが、
このサンプル程度の内容ならば普通のArray型でも問題ないと思われる。

var img = [Image.load_from_file("user://save_ss1.png"), Image.load_from_file("user://save_ss2.png")]
ここでセーブ時のサムネイルとなる画像を格納している。サムネイルがない場合は何も表示されないと思う。

「3_dekake.tscn」「6_reji.tscn」「8_heya.tscn」の各シーンに選択肢があり、
選択すると「flag」という列挙型の値がgameflagに加算される。
これらの値の組み合わせで分岐先が決定する仕様である。
flag列挙型は「1、2、4、8、16、32」の値が割り当てられており、
例えばgameflagが「2 + 8 + 32」で合計42になるとベストエンディングになる。

load_textメソッドはシナリオファイルを読み込み、配列に格納する。
このゲームでは「text01.txt」「text02.txt」という2つのシナリオを使っている。
2つに分ける必要はなかったが複数のシナリオファイルでも対応できる仕組みにしてみた。
ファイルの具体的な読み込み方はGlobal.gdのコメントを参照されたし。

◆NovelEngine.tscn
スクリプトエンジンの具体的な機能についてはnovel_engine.gdを参照されたし。

処理の流れとしては、
シナリオが入った配列「Global.mes」
↓
var order = Global.mes[Global.lines].split("@", true, 1)
の箇所で「@」で区切り、order配列に格納する。
@より左が識別記号(order[0])、@より右がラベル(order[1])となる。
↓
match文でorder[0]をチェックする。
識別記号であれば対応した処理をし、
識別記号がない場合はorder[0]にシナリオが格納されているので画面に表示する。
btnwaitという変数がtrueの場合は「▼」がアニメーションするボタン待ち状態となる。
「▼」のアニメーションは「bbcode」というものを使って記述している。
詳しくはGodotドキュメントを検索されたし。
余談だがappend_textを使用してbbcodeを含むテキストを追加しようとしても上手く機能しなかった。
そのため「text += "[wave amp=25 freq=25]▼[/wave]"」と記述している。

左クリックされると「▼」が改行コードに変換される。
この辺の具体的な処理はnovel_engine.gdのRegExが使われている箇所を参照されたし。
  
◆GameMenu.tscn
「func _input(event: InputEvent) -> void:」と記述している箇所がある。
シューティングゲームやARPGのサンプルで使用した「_unhandled_input」は、
UIへのポインティング(または画面へのタッチ)を優先してしまうため、
GameMenuノードのエリア内で右クリックしてもメニューが開かないのである。
そのためUI関係なしに画面上のどこでも入力を取得してくれる「_input」メソッドを使用している。

%Save1Button.connect(&"pressed", _save.bind(1))などのシグナルを接続する箇所で、
引数を持つシグナルメソッドを作成した場合は「.bind」で引数を指定する記述になる。

セーブ/ロードの処理は解説すると難しくなるのでgame_menu.gdも参照されたし。
セーブの流れとしては、
「FileAccess.open_encrypted_with_pass」を使ってユーザーフォルダ(user://～)に、
任意の名前のセーブデータを指定、書き込みモードを指定、暗号化するためのキーをStringで渡している。
また暗号化のキーに「OS.get_unique_id()」を渡してデバイスIDをパスワードにすることもできるようだ。
↓
if file.file_exists("user://savegame" + str(num) + ".data"):
で指定されたファイルパスにセーブデータがあるかチェックする。
↓
Global.save.time = Time.get_datetime_string_from_system()
これで時刻を取得する。
Global.img[num - 1] = get_viewport().get_texture().get_image()
ビューポートからスクリーンショットを取得しimgに格納する。
Global.img[num - 1].save_png("user://save_ss" + str(num) + ".png")
スクリーンショットのサムネイル画像を作成しユーザーフォルダに保存する
↓
file.store_var(Global.save)
これでセーブするデータを書き込む。
↓
セーブの時刻とサムネイル画像を表示して、ファイルを閉じる。

ロードの流れはセーブと少し似ているが、
「FileAccess.open_encrypted_with_pass」を使用し、
任意の名前のセーブデータを指定、読み込みモードを指定、暗号化するためのキーをStringで渡している。
↓
if file != null && file.file_exists("user://savegame" + str(num) + ".data"):
上記の箇所では「file != null」が追加されている。これがないとセーブデータがない状態でロードするとエラーが発生する。
↓
Global.save = file.get_var()
これでセーブデータを変数に読み込む。
↓
読み込んだセーブデータをどう使うかはgame_menu.gdを参照されたし。すいません。
↓
ファイルを閉じる

func _input(event: InputEvent) -> void:　メソッドで、
if event.is_action_pressed(&"RMB") && !get_tree().current_scene is CanvasLayer && $"/root/Global/AnimationPlayer".current_animation == "":
という長い条件式がある。
その中で「!get_tree().current_scene is CanvasLayer」という箇所があるが、
「カレントシーンがCanvasLayer型でなければ」という意味である。
このサンプルの各シーンファイルは親がCanvasLayer型のものとそうでないものとに分かれている。
ロゴシーン、タイトル、ゲームオーバー、ゲームクリアーなどはCanvasLayer型を親とするので、
右クリックしてもゲームメニューが開かないようになっている。
逆にゲーム中の各シーンではゲームメニューが開くようになっている。
このようにノードの型を上手く利用した条件式を使えばメニューを開きたい場所とそうでない場所とを簡単に区別することが可能だ。

◆LOGO.tscn
特筆すべき点はあまりないが、
Sprite2Dのskewプロパティを使って文字が斜めになるアニメーションを作ってみた。

◆Title.tscn
title.gdを参照していただきたいが、

for i in range(1, 3):　以下の処理は、
タイトルが表示されたときにセーブファイルがあれば、
セーブ時間とサムネイルを先に読み込んでおく処理をしている。

タイトルメニュー項目のシグナルメソッドの多くはラムダ関数で記述している。
Godotのラムダ関数はメソッドの引数が「Callable型」の場合によく利用することが多い。
……というよりラムダ関数はCallable型を作成するようだ。

func _load(num: int) -> void:
ロードの処理を行っているがこれはgame_menu.gdにもあると同じ処理である。
タイトル画面の方では「つづきから」を押すとロードボタンしか表示されないので別に作成した。

◆1_ietokawa.tscn
ゲームシーンはシーン名の頭に「1_」などの番号を振っている。

_readyメソッドの最初に、
Global.save.start_label = "ゲーム開始"
Global.save.text_name = "text01"
このような処理を入れている。
start_labelはシーンの最初を示すラベル。
text_nameはそのシーンで読み込まれるシナリオファイルの名前。

match Global.label:
ここでラベルが格納されていればそこへ飛ぶようにしている。

以下も似たようなものが続く。

◆2_gyunyu.tscn
特筆すべき点はない。

◆3_dekake.tscn
ここからtext02.txtシナリオに変わる。

選択肢が表示されるシーンだが、選択肢はあらかじめButtonノードで作っておいた。
ボタンを押した後の処理はシグナルメソッド内でラムダ関数で記述している。

このサンプルではSprite2Dの表示を切り替えているだけだが、
AnimationPlayerやTweenを使ってアニメーションさせることもできる。

◆4_syoutengai.tscn
特筆すべき点はない。

◆5_super.tscn
特筆すべき点はない。

◆6_reji.tscn
選択肢があるだけで特筆すべき点はない。

◆7_ieji.tscn
match Global.save.gameflag:
この箇所でこれまでの選択肢によるフラグ値分岐を行っている。
ただ現在このシーンでゲームを保存してロードすると、
最初の文章が二度表示されてしまうバグが残っている。
修正方法を考え中のためとりあえずそのままにしているがゲームは進行できる。

◆8_heya.tscn
選択肢があるだけで特筆すべき点はない。

◆GameOver.tscn
各種データを初期化してタイトルに戻るのみ。

◆GameClear.tscn
スクリプトはgame_over.gdと同じ。画像が違うのみ。

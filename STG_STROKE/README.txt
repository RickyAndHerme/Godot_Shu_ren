===================================================================
　　　　Tutorialシューティングゲーム　STROKE 

　　　　作者　リッキー
	　　掲載URL　https://shu-ren.fc2.net/blog-entry-7.html
===================================================================
【概要】

　2Dシューティングゲームの機能満載のサンプルゲームです。　
　
　◆操作方法
　・WASDキーでプレイヤーを移動し、SPACEキーでショットを発射します。
　・出現する敵を倒し続けると、敵の出現間隔や攻撃が少しずつ激しくなります。
　・残機は1機。エンドレスです。

　◆サンプルの概要
　・タイトル画面/ゲーム画面/ゲームオーバー画面の遷移
　・背景画像のスクロール
　・プレイヤーの移動
　・ショットの処理/パーティクル/敵との判定
　・敵の移動/狙い弾、方向弾
　・爆発/パーティクル
　・スコア処理
　・BGM、効果音の処理
　・外部フォントの使用
　・ゲームの進行に伴って上昇する難易度
　
------------------------------------------------------------------ 
【実行環境】

・バージョン：Godot Engine v3.4.2.stable
・OS　　　　：Windows 10 64-bit
・CPU　 　　：AMD FX-8370E Eight-Core Processor
・メモリ　　：16GB
・GPU　 　　：AMD Radeon RX 6600
------------------------------------------------------------------ 
【サポート】

　誤記、バグなど発見しましたらコメントにでもどうぞ。
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
2021/7/4　Ver1.0
　・最初のリリース

2024/03/08 Ver1.1
　・Godot4.3.dev4に対応
　・GlobalGroups機能の使用、いくつかの処理構文を見直し最適化
　・一部グラフィック変更
　・BGM修正
　・難易度調整
　・ブートスプラッシュ画像を修正
　・コメントの修正
　・解説の追加
　・著作権表記の修正

------------------------------------------------------------------ 
【解説】
------------------------------------------------------------------ 
※4.0以降、3.x系からメソッド名に変更が加えられている箇所がある。
※解説は今後追加される可能性あり。

◆全般
変数の宣言で「:=」ウォルラス演算子(セイウチ演算子)を使用。
「:=」で初期化しておくと、型が異なる値が代入された場合にエディター上でエラー通知を出してくれる。

画像やフォントはインスペクタのCanvasItem > Texture > Filterに「Nearest」を設定し画像がくっきりするようにしている。

4.3から搭載されたGlobalGroupsでキャラクターを全面管理するように変更した。
従来のグループはSceneGroupsという名称になっているがGlobalGroupsもSceneGroupsも使い方はほとんど変わらないようだ。
違いはGlobalGroupsはproject.godotにグループ名が記録されることでシーン単位ではなくゲーム全体で名前が保持される点にある。
それによりシーン毎にグループ名設定をする必要はなくなり管理しやすくなった。
GlobalGroupsはプロジェクト設定や従来のグループ管理のところから設定できる。
グループの特性としてグループ名は常にシーンを跨いでノードへのグローバルアクセスを可能にするので、
インスタンスシーンの内側から外側へアクセスすることが容易にできる。
別の方法としてシグナルを飛ばしてシグナルメソッドを利用する方法もあるがGlobalGroupsの方が直感的だったのでこちらを採用した。

ボタン入力がある箇所で「&"left"」のようなStringName型を引数に渡している。
StringName型はインプットマップのアクション名、グループ名、AnimationPlayerのアニメーション名などに使われている。
「Input.is_action_pressed」などで引数にキーの名前を指定する際にオートコンプリートが働くが、
GodotEngineエディター内で登録したこれらの名前はStringName型として記録されているようだ。
「&」を付けない通常のString型でも動作はするが、長文の文字列だと文字列比較に時間がかかると思われるので、
StringName型を使える箇所では「&」つけて高速化するとよいだろう。

多くのシーンでノードの頭に「$」ではなく「%」をつけて呼び出している。
シーンツリーでノードを選択し、右クリックメニューから「Access as Unique Name」を選択すると、
シーン固有ノードとなり、フルパスでノード名を書かなくても呼び出せるようになる。
シーンの構造が複雑になってきたときに便利である。
また自動読み込みしたノードにアクセスする際は「$"/root/Global/PlayerShot".play()」といった書き方になる。

各シーンの階層を持つノードは「ノードのグループ化(Ctrl+G)」を行いまとめて移動しやすいようにしている。
よくコリジョンだけ移動させてズレてしまうことがあるがノードをグループ化しておけばそういう心配はない。

◆Global.tscn
BGM/SEの管理と、グローバル変数の管理をしている。その他特筆すべき点はない。

◆Title.tscn
インスペクタのSprite2D > Region > RectをAnimationPlayerで調整し背景をスクロールさせている。
PushSpaceKeyノードもVisible Characterプロパティを調整して点滅アニメーション実現している。

AspectRatioContainerを親ノードにしている。これを設置するとRatioプロパティから画面アスペクト比を調整できる。
このサンプルでは4:3のアスペクト比で固定してるため意味はないが、ゲームによっては16:9や16:10、または9:16など、
様々なアスペクト比に対応する場合があるかもしれない。
そういったときにUIを配置しているControlノード類のレイアウトをある程度維持したままRatio値で調整できるようになっている。

◆Transition.tscn
フェードイン/アウトでシーンの切り替えを行う機能を搭載するにあたりTweenクラスを利用している。
4.xからTweenにノードは必要なくスクリプトのみで実装できるようになった。
使い方やbind()についての解説は「Transition.gd」を見ていただくとして、待機を実現する方法として、
「await get_tree().create_timer(1.0).timeout」という記述を使っている。
これは直前の「.play_backwards.bind("fade"))」を実行した後、1秒間シーンを待機させることで、
フェードイン中に他の操作を受け付けないようにしている。
最後の「.play.bind("RESET"))」でTransitionノードのプロセスモードをDisabledにすることで終了している。
このサンプルではprocess_modeやvisibleプロパティをAnimationPlayerで管理することでスクリプトの量を減らしている。

◆Main.tscn
特筆すべき点はない。詳しくはMain.gdを参照されたし。

◆Player.tscn
Player.gdの_ready()メソッドで「area_entered.connect(_on_area_entered)」の記述がある。
今回のサンプルは組み込みシグナルをすべてスクリプトで接続している。
ドキュメントの「初めての2Dゲーム(Your first 2D game)」だと画面右のノードドックから接続設定をしているが、
スクリプトで接続すると、ノードタイプを後で差し替えたりしても基本的にスクリプト側の修正だけで済むため、慣れると便利だ。

rolltimeという変数を用意して左右のボタンの押す長さによって自機の傾きに変化をつけている。
同じように自機のバーナーアニメーションもコントロールしている。

その他はPlayer.gdのコメントを参照されたし。

◆Shot.tscn
Particles2Dの設定は3.xより項目が追加されているのでインスペクタを参考にしていただくとよい。
その他はShot.gdを参照されたし。

◆Enemy.tscn/Enemy2.tscn
Shot.gdと似ているところもあるので特筆すべき点はない。詳細はEnemy.gdを参照されたし。

◆appear1.tscn/appear2.tscn
特筆すべき点はない。詳細はappear1/appear2.gdを参照されたし。

◆Bomb.tscn
特筆すべき点はない。詳細はBomb.gdを参照されたし。

◆tekishot1.tscn/tekishot2.tscn
tekishot1.gdでプレイヤーの位置を取得する処理で「if get_tree().get_first_node_in_group(&"player") 」を使用している。
「is_in_group(&"enemy")」などはグループを判定するが、「get_first_node_in_group(&"player")」は対象グループの最初の検索にヒットしたノードにアクセスする。
プレイヤーは1体しか存在しないので最初にヒットしたノードがプレイヤーになる。
以前のソースでは「$Player」の参照を取得してアクセスしていたが、ノード名でアクセスする箇所とグループでアクセスする箇所が混在してしまうため、
グループアクセスで統一を図った。
ドキュメントではノード名でアクセスをする記述が多いが、ノード名は単体でしかアクセスができないため慣れてくると使い勝手が悪い。
シーンを跨いでノードにアクセスしたいときは「get_tree().current_scene.get_node("Player").positon」などの方法を取ることもできる。
しかしこの方法は後々ノード名が変更されたりすると修正せねばならない不便さがある。

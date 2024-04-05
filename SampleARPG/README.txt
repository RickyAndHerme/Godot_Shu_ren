===================================================================
　　　　SampleARPG 

　　　　作者　ゼロニー
	　　掲載URL　https://shu-ren.fc2.net/blog-entry-6.html
===================================================================
【概要】

　アクションRPGの基本的なサンプルです。
　
　◆操作方法
　・WASDキーでプレイヤーを移動します。
　・SPACEキーで攻撃します。
　・Tabキーでアイテムメニューを開きます(現在は形だけ)
　・Escキーでオプションメニューを開く(セーブは未実装)

　◆サンプルの概要
　・タイトル画面/フィールドのシーン遷移
　・TileMapを使ったマップ(街、フィールド、ダンジョンを行き来できる)
　・AnimationTreeでプレイヤーのアニメーションを管理
　・プレイヤーとモンスター、プレイヤーの剣とモンスターの当たり判定(ノックバックする)
　・押して動かせる岩
　・スイッチを踏むとフィールドマップに橋がかかる処理
　・アイテムメニューの外側のみ。
　・ウィンドウ/フルスクリーンの切り替え
　
------------------------------------------------------------------ 
【実行環境】

・バージョン：Godot4.3.dev5
・OS　　　　：Windows 10 64-bit
・CPU　 　　：AMD Ryzen 5 5600X 6-Core Processor
・メモリ　　：16GB
・GPU　 　　：AMD Radeon RX 6600
------------------------------------------------------------------ 
【サポート】

　誤記、バグなど発見しましたらこちらのコメント欄にでもどうぞ。
　https://shu-ren.fc2.net/blog-entry-6.html
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
2021/6/26　Ver1.0
　・最初のリリース。

2024/04/05 Ver1.1
　・Godot4.3.dev5で実装
　・タイトル画面/フィールドのシーン遷移
　・街、フィールド、ダンジョン実装
　・当たり判定時のノックバック
　・アイテムメニューの外側のみ。
　・ウィンドウ/フルスクリーンの切り替え
　・スクリプトの最適化

------------------------------------------------------------------ 
【解説】
------------------------------------------------------------------ 
◆全般
変数の宣言で「:=」ウォルラス演算子(セイウチ演算子)を使用。
「:=」で初期化しておくと、型が異なる値が代入された場合にエディター上でエラー通知を出してくれる。

画像やフォントはインスペクタのCanvasItem > Texture > Filterに「Nearest」を設定し画像がくっきりするようにしている。

4.3から搭載されたGlobalGroupsでキャラクターを全面管理するように変更。
従来のグループはSceneGroupsという名称になっているがGlobalGroupsもSceneGroupsも使い方はほとんど変わらないようだ。
違いはGlobalGroupsはproject.godotにグループ名が記録されることでシーン単位ではなくゲーム全体で名前が保持される点にある。
それによりシーン毎にグループ名設定をする必要はなくなり管理しやすくなった。
GlobalGroupsはプロジェクト設定や従来のグループ管理のところから設定できる。
グループの特性としてグループ名は常にシーンを跨いでノードへのグローバルアクセスを可能にするので、
インスタンスシーンの内側から外側へアクセスすることが容易にできる。
GlobalGroupは4.3以上でないと機能しないと思われる……たぶん。

ボタン入力がある箇所で「&"left"」のようなStringName型を引数に渡している。
StringName型はインプットマップのアクション名、グループ名、AnimationPlayerのアニメーション名などに使われている。
「Input.is_action_pressed」などで引数にキーの名前を指定する際にオートコンプリートが働くが、
GodotEngineエディター内で登録したこれらの名前はStringName型として記録されているようだ。
「&」を付けない通常のString型でも動作はするが、長文の文字列だと文字列比較に時間がかかると思われるので、
StringName型を使える箇所では「&」つけて高速化するとよいだろう。

多くのシーンでノードの頭に「$」ではなく「%」をつけて呼び出している。
シーンツリーでノードを選択し、右クリックメニューから「Access as Unique Name(固有名でアクセス)」を選択すると、
シーン固有ノードとなり、フルパスでノード名を書かなくても呼び出せるようになる。
シーンの構造が複雑になってきたときに便利である。
また自動読み込みしたノードにアクセスする際は「$"/root/Global/PlayerShot".play()」といった書き方になる。

各シーンの階層を持つノードは「ノードのグループ化(Ctrl+G)」を行いまとめて移動しやすいようにしている。
よくコリジョンだけ移動させてズレてしまうことがあるがノードをグループ化しておけばそういう心配はない。

設計に改良の余地があるため、搭載されていない機能は設計の最適化を図った上で実装したい。

◆Global.tscn
BGM/SEの管理、各メニュー、プレイヤー体力の表示、グローバル変数の管理をしている。

◆OptionMenu.tscn
Escメニュー。現在はウィンドウ/スクリーン切り替えとタイトルへ戻るのみ機能する。
セーブは未実装(すいません)

下記の条件式は見ての通りすごく長いが、
Escキーが押され、PlayerMenu.visibleがfalseで、プレイヤーが存在しており、アニメーションが再生中でなければ、という条件を設定している。

if event.is_action_pressed(&"escape") and !$"/root/Global/PlayerMenu".visible and get_tree().get_first_node_in_group(&"player") and $"/root/Transition/AnimationPlayer".current_animation == "":
	visible = !visible
	get_tree().paused = visible

また「visible = !visible」はvisibleの否定、つまり反転した結果をvisibleに代入している。
これによりメニューが「表示されていない状態」でEscキーを押すとメニューが表示され、メニューが「表示された状態」でEscキーを押すとメニューが消えるという動作を実現している。

$/root.mode = Window.MODE_FULLSCREEN　という箇所があるが、rootノードにはWindowノード、ViewPortノードも含まれている。
Windowノードはウィンドウ/フルスクリーンの切り替えの他、解像度などの変更ができる。
ViewPortノードはアンチエイリアシング関係のプロパティなどが調整できる。
プロジェクトを実行中に、シーンツリーに「リモート」という項目が表示される。リモートに切り替えるとrootノードが確認できる。

◆PlayerMenu.tscn
Tabキーで開く。プレイヤーメニューはアイテムアイコンにbuttonノードを使用している(現在は形だけで何も起きない)
敵を倒すと経験値とゴールドがカウントされ、ダメージを受けると体力が減る。レベルアップはまだ実装していない。
今後はアイテムの使用、装備の切り替えなど改良する予定。

◆PlayerState.tscn
特筆すべき点はない。

◆Title.tscn
特筆すべき点はないがGlobal.player_posでプレイヤー初期位置を指定し、プレイヤーの体力を初期化している。

◆Transition.tscn
tweenを使用してモザイク、フェードを処理している。
process_mode、visible、shader_parameterなどはAnimationPlayerで管理している。
スクリプトも参照されれたし。

◆FieldArea.tscn
TileMapノードではレイヤー、アニメーション、コリジョン、コリジョンレイヤーなどを設定している。
インスペクタのTileMap > Layersでレイヤーを設定する。名前をつけておくとよい。
TileSetからはコリジョンレイヤーを設定した。キャラクターと壁衝突を判定するため「wall」というレイヤーを設定した。
その他player、enemy、npc、ok_pushのレイヤーが存在する。詳細はインスペクタを参照されたし。

海アニメーションをコリジョンありとなしの2つを用意した。
橋を掛けるイベントでocean_collisionに橋を掛けると、コリジョンが邪魔してそのままではプレイヤーは渡れない。
そこで橋を掛けるときに海のマップチップをocean_no_collisionに変更してその上に橋を掛けて渡れるようにした(field_area.gdを参照)

海アニメーションタイルの作り方。
1.画面下のタイルマップエディタのTileSetパネルを開く。
2.アニメーションさせたい画像をアトラスで追加し「アトラスにタイルを自動的に作成しますか」で「いいえ」を選ぶ。
3.左端のタイルのみ選択する。
4.「セットアップ、選択、ペイント」項目の「選択」を選ぶ。
5.アニメーション項目の「列」に全体のコマ数を入力。
6.Framesの「要素を追加」で列と同じ分だけコマを増やす。
7.一旦タイルを配置してアニメーションしているか確認する。必要に応じてDurationでアニメーション速度を調整する。
8.物理 > Physics Layer0を開き、点が縦3つ並んだメニューから「デフォルトのタイル形状に戻す(Fキー)」を押してコリジョンを設定する。

フィールド上の橋には縦向きと横向きのものがあり、横向きは代替タイルで設置した。
タイルを選択し右クリックから「代替タイルを作成」を選択すると右に代替タイルが表示される。
代替タイルを選択し、水平反転や垂直反転にチェックを入れるとタイルの向きを変更できる。

今回は使用していないがTileMapエディターにシーンコレクションを追加すると、シーンをタイルのように配置できるようになる。
敵、街、宝箱、スイッチなどで活用するといいだろう。

TownEntやDungeonEntオブジェクトには別シーンへ移動するための「gateway.gd」がアタッチされている。
触れると指定したPathのマップ、WarpPointで指定した座標に移動するようになっている。詳細はgateway.gdを参照されたし。

◆Dungeon.tscn
階段からFieldAreaと往来ができるようにしただけで現在は何も無い。

◆Town.tscn
FieldAreaと往来ができるようにしただけで中身はまだ未実装である。
Town_exitオブジェクトに触れるとフィールドへ移動する。

◆Switch1.tscn/Switch2.tscn
スイッチを押すと_on_body_enteredメソッドが発動し「hashi_kakeru」シグナルを飛ばす。
シグナル受信先はfield_area.gdにあり、「set_cell」メソッドを使ってタイルを変更する処理を行っている。詳細はfield_area.gdを参照されたし。
現在は1、2と分かれているが汎用的なswitchスクリプトを作って統一を図りたいところである。

◆Player.tscn
Spriteはキャラクターの画像で、Sprite2は剣の画像を設定している。

Camera2Dが子にあるのでキャラクターが動けばカメラが動くようになっている。
PositionSsmoothingのEnabledをオンにしているのでカメラはスムーズに追尾する。

SwordHitBoxは剣のコリジョン領域である。
攻撃したときのみ有効になるようにAnimationPlayerで調整している。

#======================================
AnimationTreeではTreeRootにAnimationNodeStateMachineを設定した。
実際のステートの構成はAnimationTreeを確認していただきたい。

最初は必ず「Start」から開始される。
「Walk」「Attack」はBlendShape2Dで作成したステートである。

矢印線を選択するとトランジションの項目で種別を選択できる。
今回はすべて「終りに」を選択している。

・即座：(現在のアニメーションをキャンセルして次のアニメーションを即実行)
・同期：(アニメーション切り替え時に前回の再生位置から再生する)
・終りに：(アニメーション終了後に次のアニメーションを再生する)

「Start」→「Walk」→「End」
　　　　　　　↑
　　　　　「Attack」

AnimationPlayer上で「Walk」はループが設定されているので、
Start後は「Walk」に移り、「Walk」をループ再生し続ける。「End」へは行かない。
スペースキーを押すと「Attack」が再生され、アニメーションが終了すると「Walk」に戻る。
仮に「Start」→「Attack」も結ぶと、「Start」と同時に「Walk」と「Attack」が再生される？……かもしれない。

「Walk」「Attack」の右にある鉛筆アイコンを選択するとブレンド設定ができる。
BlendShape2DはX、Yのベクトルのブレンドに応じてアニメーション切り替えを自動的に行う仕組みを持っている。
ひし形と鉛筆のアイコンを選択するとグラフにキーを打つことができる。
例えば上のキーには「down」アニメーションが打たれ、下のキーには「UP」アニメーションが打たれている(上が1.0、下が-1.0)

上下は1.0、-1.0でキーが打たれ、左右は-0.9、0.9でキーが打たれている。
これは例えば右上に移動する際に左右のブレンド値の方が小さいのでキャラクターは右向きのまま右上に移動することになる。
試しに上下を0.9、-0.9、左右を-1.0、1.0にすると右上移動時は上向きのアニメーションで移動するはずである。
他の機能に関しては公式ドキュメントを参照あれ。

スクリプト上での呼び出し方は下記のスタイルになる。
$AnimationTree.set(&"parameters/Walk/blend_position", dir)
$AnimationTree.get(&"parameters/playback").travel(&"Walk")
#======================================
player.gdではキャラクターの状態をmatchで分岐させている。
岩を押したとき、モンスターに接触したときの処理を書いているが分離したいところだ。
剣がモンスターに当たった際の処理も書いているがこちらも分離したい。
その他player.gdを参照されたし。

◆Tako.tscn
Area2DとCollisionShape2Dを使って円形の可視範囲を作成した。
下記の処理でプレイヤーがエリアに入るとTakoが向かってくるようにしている。

dir = position.direction_to(get_tree().get_first_node_in_group(&"player").position)

direction_toで2点間の正規化ベクトルを返す事ができる。
ただしbody_enteredが実行されたときにだけ追尾され、再度body_enteredが発生しないとベクトルは再計算されない。
プレイヤーがエリアから出るとランダムな方向に移動する。
あまり賢くない動きをしている。

◆Obake.tscn
やっていることはTakoと同じで、プレイヤーがエリアに侵入すると突進し、エリア外に出ると離れる動作となっている。
こちらも賢くない。

◆Iwa.tscn
詳細はiwa.gdを参照されたし。

%RayCast2D.target_position = dir * 15

dirに15を掛けているのはタイルサイズからはみ出さない長さをレイで判定するためである。
本来プレイヤーは岩を斜めに押すこともできるが、レイの長さが15ほどあれば1タイル分の狭い幅なら岩は斜めに押せなくなる。

◆@@@@@@@@.tscn
テスト用シーン。何か試したいときに使っている。
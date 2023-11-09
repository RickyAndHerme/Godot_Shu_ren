===================================================================
　　　　Block Break 

　　　　作者　リッキー
===================================================================
【概要】

　ブロック崩しゲームです
　
　◆操作方法
　・A、Dキーでパドルを左右に移動しボールを弾きます。
　・ボールは2つ出てきます。
　・ボールをすべて失うとゲームオーバー、ブロックをすべて崩すとゲームクリアーです。

　◆サンプルの概要
　シンプルなブロック崩しです。コリジョンやボールのバウンスを処理しています。
　
------------------------------------------------------------------ 
【実行環境】

・バージョン：Godot Engine v4.2.beta4
・OS　　　　：Windows 11 64-bit
・CPU　 　　：AMD Ryzen 5 5600X 6-Core Processor
・メモリ　　：16GB
・GPU　 　　：AMD Radeon RX 6600
------------------------------------------------------------------ 
【サポート】

　誤記、バグなど発見しましたらコメントにでもどうぞ。
------------------------------------------------------------------ 
【免責事項】

　本サンプルデータ(フォントを除く、プログラム、画像、サウンド等含む全て)の著作権は
　リッキーが保持しておりますが営利目的ではない二次利用は可能とします。
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
Portions of this software are copyright © 2023 The FreeType Project (www.freetype.org). All rights reserved.

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
2022/2/11　Ver1.0
　・最初のリリース。

2023/06/05　Ver1.1
　・Godot4.0に対応
　・概要を編集
　・著作権表記を修正
　・解説を追加

2023/11/9　Ver1.2
　・Godot4.2.beta4に対応
　・著作権表記を追加
　・Paddleの移動処理をより簡潔な書き方に修正
　・他細かいところを修正

------------------------------------------------------------------ 
【解説】
------------------------------------------------------------------ 
4.0以降、3.x系からメソッド名に変更が加えられている箇所がある。

◆全般
変数の宣言で「:=」ウォルラス演算子(セイウチ演算子)を使用。
「:=」で初期化しておくと、型が異なる値が代入された場合にエディター上でエラー通知を出してくれる。

◆Main.tscn
ゲームオーバーとゲームクリアーのLabel表示にCentrContainerとVBoxContainerを使用し、
画面の中央に文字が表示されるようにしている。
ゲームの終了状態に応じて、親となるCentrContainerの表示/非表示を切り替えている。

GameOverCenterContainerとGameClearCenterContainerのノードの頭に「$」ではなく「%」をつけて呼び出している。
シーンツリーでノードを選択し、右クリックメニューから「Access as Unique Name」を選択すると、
シーン固有ノードとなり、フルパスでノード名を書かなくても呼び出せるようになる。
シーンの構造が複雑になってきたときに便利である。

◆Paddle.gd/Main.gd
Paddleの移動処理は、以下の二行で書ける。
vec = Input.get_vector(&"left", &"right", &"up", &"down")
vec += vec * speed * delta

Input.get_vectorで4つ方向のベクトルを手軽に取得してくれる。
またベクトルの長さも自動的に正規化されているのでnormalized()をしなくてよい。

ボタン入力がある箇所で「&"left"」のようなStringName型を引数に渡している。
StringName型はインプットマップのアクション名、グループ名、ローカライズデータのキー名などに使われている。
Input.is_action_pressedなどで引数にキーの名前を指定する際にオートコンプリートが働くが、
GodotEngineエディター内で登録したこれらの名前はStringName型として記録されているらしい。
「&」を付けない通常のString型でも動作はするが、長文の文字列だと文字列比較に時間がかかると思われるので、
StringName型を使える箇所では「&」つけて高速化するとよいだろう。

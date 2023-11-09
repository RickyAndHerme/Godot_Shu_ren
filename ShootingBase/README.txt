===================================================================
　　　　ShootingBase 

　　　　作者　リッキー
===================================================================
【概要】

　シューティングゲームの基本的なサンプルです。
　
　◆操作方法
　・WASDキーでプレイヤーを移動し、SPACEキーでショットを発射します。
　・敵を倒すとスコア5点、敵を画面外に逃がすと-5点、敵/敵の弾に接触すると-10点となります(エンドレス)

　◆サンプルの概要
　・タイトル画面/シーン遷移
　・プレイヤーの移動
　・ショットの処理/パーティクル/敵との判定
　・敵の移動/弾を撃つ
　・爆発/パーティクル
　・スコア処理
　・効果音の処理

　＊プロジェクト>プロジェクト設定>一般>Display>Window
　　└元の解像度が小さいためSizeの「Test Width」「Test Height」を1280*720に拡大しております。
　　└Strechの「Mode：Viewport」「Aspect：keep」に設定してます。
－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－ 
【【実行環境】

・バージョン：Godot Engine v3.4.2.stable
・OS　　　　：Windows 10 64-bit
・CPU　 　　：AMD FX-8370E Eight-Core Processor
・メモリ　　：16GB
・GPU　 　　：AMD Radeon RX 6600
－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－ 
【サポート】

　誤記、バグなど発見しましたらコメントにでもどうぞ。
－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－ 
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

－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－ 
【更新履歴】
2020/09/26　Ver1.0
　・最初のリリース。

20/09/29　Ver1.1
　・バグ修正
　・タイトル画面とシーン遷移処理を追加。
　・画像のボケ修正(画像を「2D Pixel」で再インポートして対応)
　・敵が弾を撃ってくるように修正。

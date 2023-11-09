===================================================================
　　　　SampleARPG 

　　　　作者　リッキー
===================================================================
【概要】

　アクションRPGの基本的なサンプルです。
　まだまだ未完成ですが基本要素が出来始めたのでこの辺で一旦公開します。
　今後もバージョンアップする予定です。
　今回はフィールドの敵、橋をかけるスイッチ2箇所、動く岩まで実装しています。
　
　◆操作方法
　・WASDキーでプレイヤーを移動し、SPACEキーで攻撃します。
　・敵に当たると色が変わりますが今の所戻りません。

　◆サンプルの概要
　・タイトル画面/フィールドのシーン遷移
　　└モザイク処理をシェーダーで実装。
　・TileMapを使ったマップ
　　└2つのレイヤーを使用。
　　└海のマップチップをアニメーション対応。
　・AnimationTreeでプレイヤーの移動アニメーションを管理
　・プレイヤーと敵、プレイヤーの剣と敵の当たり判定
　・押して動かせる岩
　　└岩の移動方向をレイキャストで判定
　・スイッチを踏むとフィールドマップに橋がかかる処理

　・gameフォルダにゲームの実行ファイルを入れました。
　
－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－ 
【実行環境】

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

・フォントに「PixelMplus10-Regular」を使用しております。
－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－ 
【更新履歴】
2021/6/26　Ver1.0
　・最初のリリース。

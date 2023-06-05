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

【各種ライセンス】

　このゲームは、次のライセンスの下で利用可能なGodotエンジンを使用しています:

　Copyright (c) 2007-2021 Juan Linietsky, Ariel Manzur. Copyright (c) 2014-2021 Godot Engine contributors.

　Permission is hereby granted, free of charge, to any person obtaining a copy of this software
 and associated documentation files (the "Software"), to deal in the Software without restriction,
 including without limitation the rights to use, copy, modify, merge, publish, distribute,
 sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

　上記の著作権表示およびこの許可通知は、ソフトウェアのすべてのコピーまたは大部分に含まれるものとします。

　本ソフトウェアは、市場性、特定の目的への適合性、および権利の非侵害の保証を含みますが、明示または
　黙示を問わず、これらに限定されていないいかなる保証もなしに「現状のまま」提供されます。いかなる場合に
　おいても、作者または著作権者は、契約、不法行為、またはその他の行為、本ソフトウェアまたは本ソフトウェ
　アの使用または他の取引に起因もしくは関連するいかなる請求、損害またはその他の責任についても責任を
　負わないものとします。

・Portions of this software are copyright © <year> The FreeType Project (www.freetype.org).
　All rights reserved.

・フォントに「PixelMplus10-Regular」を使用しております。
－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－ 
【更新履歴】
2021/6/26　Ver1.0
　・最初のリリース。

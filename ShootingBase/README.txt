===================================================================
　　　　ShootingBase 

　　　　作者　リッキー
	　　掲載URL　https://shu-ren.fc2.net/blog-entry-2.html
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
【実行環境】

・バージョン：Godot Engine v3.2.3.stable
・OS　　　　：Windows 10 64-bit
・CPU　 　　：AMD FX-8370E Eight-Core Processor
・メモリ　　：16GB
・GPU　 　　：NVIDIA GeForce GTX 750 Ti 
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

　このゲームは、次のライセンスの下で利用可能なGodotエンジンを使用しています:

　Copyright (c) 2007-2020 Juan Linietsky, Ariel Manzur. Copyright (c) 2014-2020 Godot Engine contributors.
　Permission is hereby granted, free of charge, to any person obtaining a copy of this software
　and associated documentation files (the "Software"), to deal in the Software without restriction, 
　including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, 
　and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, 
　subject to the following conditions:

　上記の著作権表示およびこの許可通知は、ソフトウェアのすべてのコピーまたは大部分に含まれるものとします。

　本ソフトウェアは、市場性、特定の目的への適合性、および権利の非侵害の保証を含みますが、
　明示または黙示を問わず、これらに限定されていないいかなる保証もなしに「現状のまま」提供されます。
　いかなる場合においても、作者または著作権者は、契約、不法行為、またはその他の行為、
　本ソフトウェアまたは本ソフトウェアの使用または他の取引に起因もしくは関連するいかなる請求、
　損害またはその他の責任についても責任を負わないものとします。
－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－ 
【更新履歴】
2020/09/26　Ver1.0
　・最初のリリース。

20/09/29　Ver1.1
　・バグ修正
　・タイトル画面とシーン遷移処理を追加。
　・画像のボケ修正(画像を「2D Pixel」で再インポートして対応)
　・敵が弾を撃ってくるように修正。

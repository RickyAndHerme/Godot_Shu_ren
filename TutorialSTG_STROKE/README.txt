===================================================================
　　　　Tutorialシューティングゲーム　STROKE 

　　　　作者　リッキー
	　　掲載URL　https://shu-ren.fc2.net/blog-entry-7.html
===================================================================
【概要】

　解説のために作成した2Dシューティングゲームです。
　ShootingBaseのサンプルを元に大幅バージョンアップしました。
　詳しくはブログのシューティング解説に記載しております。
　
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

　※gameフォルダにゲームの実行ファイルを入れました。
　
------------------------------------------------------------------ 
【実行環境】

・バージョン：Godot Engine v3.3.2.stable
・OS　　　　：Windows 10 64-bit
・CPU　 　　：AMD FX-8370E Eight-Core Processor
・メモリ　　：16GB
・GPU　 　　：NVIDIA GeForce GTX 750 Ti 
------------------------------------------------------------------ 
【サポート】

　誤記、バグなど発見しましたらコメントにでもどうぞ。
------------------------------------------------------------------ 
【免責事項】

　本サンプルデータ(プログラム、画像、サウンド等含む全て)の著作権は
　リッキーが保持しておりますが、画像、サウンド以外は二次利用は可能とします。
　ゲーム制作等にご利用ください。
　ただし如何なる損害に対しても作者はその保障義務を一切負わないものとします。

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

　Portions of this software are copyright © <year> The FreeType Project (www.freetype.org).
　All rights reserved.
------------------------------------------------------------------ 
【更新履歴】
2021/7/4　Ver1.0
　・最初のリリース。

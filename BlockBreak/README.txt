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

・バージョン：Godot Engine v4.0.3.stable
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

　このゲームは、次のライセンスの下で利用可能なGodotエンジンを使用しています:

　Copyright (c) 2014-present Godot Engine contributors. Copyright (c) 2007-2014 Juan Linietsky, Ariel Manzur.
　Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
　to deal in the Software without restriction, inclu　ding without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
　and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

　上記の著作権表示およびこの許可通知は、ソフトウェアのすべてのコピーまたは大部分に含まれるものとします。

　本ソフトウェアは、市場性、特定の目的への適合性、および権利の非侵害の保証を含みますが、
　明示または黙示を問わず、これらに限定されていないいかなる保証もなしに「現状のまま」提供されます。
　いかなる場合においても、作者または著作権者は、契約、不法行為、またはその他の行為、
　本ソフトウェアまたは本ソフトウェアの使用または他の取引に起因もしくは関連するいかなる請求、
　損害またはその他の責任についても責任を負わないものとします。

　フォントに「PixelMplus10-Regular」を使用しております。
------------------------------------------------------------------  
【更新履歴】
2022/2/11　Ver1.0
　・最初のリリース。

23/06/05　Ver1.1
　・Godot4.0に対応
　・概要を編集
　・著作権表記を修正
　・解説を追加

------------------------------------------------------------------ 
【解説】
------------------------------------------------------------------ 
特に難しい箇所はありませんが、4.0からメソッド名に変更が加えられている箇所があります。

◆Main.tscn
ゲームオーバーとゲームクリアーのLabel表示にCentrContainerとVBoxContainerを使用し、
画面の中央に文字が表示されるようにしてます。
ゲームの終了状態に応じて、親となるCentrContainerの表示/非表示を切り替えています。

◆Ball.gd
4.0からコリジョン処理のメソッドが少し変わりました。

if col:
	vec2 = vec2.bounce(col.get_normal())
	if col.get_collider().has_method("hit"):
		col.get_collider().hit()

以前はnormal、colliderと書いていたものにget_をつけるようになりました。
修正したのはこのあたりのみ。

// http://wonderfl.net/c/nCFQ/
package{
	import caurina.transitions.Tweener;
	import flash.display.*;
	import flash.filters.*;
	import flash.geom.*;
	import flash.text.*;
	import Circle;
	
	public class HelloWorld extends Sprite{
		private var bd:BitmapData;
		public function HelloWorld():void{
			// テキストフィールド作成
			var tf:TextField = new TextField();
			tf.textColor = 0x000000;
			tf.text = "Hello\nWorld";
			tf.autoSize = "left";
			
			// テキストフィールドを元にビットマップデータの作成
			bd = new BitmapData(tf.width, tf.height, false, 0x3399ff);
			bd.draw(tf);
			// ビットマップデータにブラー効果
			bd.applyFilter(bd, bd.rect, new Point(), new BlurFilter());
			bd.draw(tf);
			
			// ビットマップデータの横幅まで
			for(var i:int = 0; i < bd.width; i++){
				// ビットマップデータの縦幅まで
				for(var j:int = 0; j < bd.height; j++){
					//addTween(ターゲット:Object, トゥイーンパラメータ:Object)
					Tweener.addTween(
						// ビットマップデータから該当するピクセルを取得し、
						// Circle()によりサークル化させ、ランダムな位置に配置
						randomize(addChild(new Circle(bd.getPixel(i,j)))),
						{
							// ビットマップデータの該当位置へ移動
							x: i * 10,
							y: j * 10,
							// 透明度を設定(1=透けない)
							alpha: 1,
							// 各サークルの移動開始時間をランダムに設定
							delay: (i + j) * .2 * Math.random(),
							// 各サークルの移動時間を設定
							time: 1
						}
					);
				}
			}
		}
		// 引数をランダムな位置に配置する
		private function randomize(d:DisplayObject):DisplayObject{
			d.x = 400 * Math.random();
			d.y = 300 * Math.random();
			d.alpha = 0;
			return d;
		}
		
	}
}
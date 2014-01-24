// http://wonderfl.net/c/nCFQ/
package{
	import flash.display.Sprite;
	
	public class Circle extends Sprite{
		public function Circle(color:uint):void{
			graphics.beginFill(color);
			// drawCircle(x座標, y座標, 半径)
			graphics.drawCircle(0, 0, 5);
			graphics.endFill();
		}
	}
}
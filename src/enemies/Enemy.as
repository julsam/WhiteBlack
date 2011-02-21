package enemies
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	import bullets.*;
	
	public class Enemy extends Entity 
	{
		public function Enemy()
		{
			super(FP.rand(FP.screen.width-10), -10);
			this.graphic = new Image(GC.GFX_ENEMY);
			this.setHitbox(10, 10);
			this.type = GC.TYPE_ENEMY;
		}
		
		override public function update():void
		{
			this.y += FP.elapsed * GC.ENEMY_SPEED;
			
			if(this.y > FP.screen.height)
				this.world.remove(this);
			
			var b:Bullet = Bullet(this.collideTypes([GC.TYPE_WHITE_BULLET, GC.TYPE_BLACK_BULLET], x, y));
			if(b != null)
			{
				hit(b);
			}
			
			super.update();
		}
		
		protected function hit(b:Bullet):void
		{
			b.world.remove(b);
		}
		
		protected function getScore():void
		{
			GV.Score += GC.ENEMY_VALUE;
		}
	}
}

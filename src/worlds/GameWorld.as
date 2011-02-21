package worlds
{
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Text;
	
	import players.Player;
	import enemies.*;

	public class GameWorld extends World
	{
		protected var player:Player;
		protected var scoreText:Text;
		
		public function GameWorld()
		{
			super();
		}
		
		override public function begin():void
		{
			player = new Player((FP.screen.width/2) - 6, 280);
			this.add(player);
			
			Text.size = 8;
			scoreText = new Text("0", 0, 0, FP.screen.width);
			addGraphic(scoreText);
			
			super.begin();
		}
		
		override public function update():void
		{
			if(this.classCount(Player) != 0 && (this.typeCount(GC.TYPE_ENEMY) == 0 || FP.random > GC.ENEMY_SPAWN_CHANCE))
			{
				if(FP.rand(2) == 0)
					add(new WhiteEnemy);
				else
					add(new BlackEnemy);
			}
			
			scoreText.text = GV.Score.toString();
			
			if(this.classCount(Player) == 0 && this.typeCount(GC.TYPE_ENEMY) == 0)
			{
				add(player);
				GV.Score = 0;
			}
			
			super.update();
		}
	}
}

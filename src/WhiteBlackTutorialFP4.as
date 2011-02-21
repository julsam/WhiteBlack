package
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	import worlds.*;
	
	[SWF(width="320",height="600")]
	
	public class WhiteBlackTutorialFP4 extends Engine
	{
		public function WhiteBlackTutorialFP4()
		{
			super(160, 300);
			FP.screen.scale = 2;
			FP.screen.color = 0x888888;
			/*
			FP.console.enable();
			FP.console.log("FlashPunk has started successfully!");
			*/
		}
		
		override public function init():void 
		{ 
			trace("FlashPunk has started successfully!");
			FP.world = new TitleWorld();
			super.init();
		} 
	}
}

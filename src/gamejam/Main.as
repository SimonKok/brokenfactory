/**
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *	
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

package gamejam {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.ui.Keyboard;
	import gamejam.entity.player.Player;
	import gamejam.game.World;
	import gamejam.ui.UILayer;
	import gamejam.util.AudioManager;
	
	/**
	 * ...
	 * @author Simon Kok
	 */
	public class Main extends Sprite {
		public static var ui:UILayer;
		public static var game:MovieClip;
		public static var backgroundGame:MovieClip;
		private static var theme:SoundChannel;
		
		/**
		 * 
		 */
		public function Main():void {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		/**
		 * 
		 * @param	e
		 */
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			Intersect.setStage(stage);
			ui = new UILayer();
			this.addChild(ui);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyEvent);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyEvent);
			this.addEventListener(Event.ENTER_FRAME, update);
			
			game = new MovieClip();
			Intersect.setGame(game);
			backgroundGame = new background_c();
			game.addChild(backgroundGame);
			backgroundGame.visible = false;
			var overlay:Sprite = new Sprite();
			overlay.graphics.beginFill(0xFFFFFF, .3);
			overlay.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
			backgroundGame.addChild(overlay);
			stage.addChild(game);
			game.addChild(new MovieClip());	//cheap fix to move player to the front
			
			theme = (new AudioManager.Theme() as Sound).play(0, int.MAX_VALUE);
		}
		
		/**
		 * 
		 * @param	e
		 */
		private function keyEvent(e:KeyboardEvent):void {
			//skip level (to be removed before release)
			if (!World.finished) {
				if(World.playing) {
					if (e.keyCode == Keyboard.ENTER && e.type == KeyboardEvent.KEY_UP) {
						trace("cheater");
						World.next();
					}
					
					//main menu
					if (e.keyCode == Keyboard.ESCAPE && e.type == KeyboardEvent.KEY_UP) {
						
					}
					
					World.getPlayer().keyEvent(e);
				}
			} else {
				World.reset();
			}
		}
		
		/**
		 * 
		 * @param	e
		 */
		private function update(e:Event):void {
			World.update();
			if(World.playing)
				World.getPlayer().update(e);
		}
		
	}
	
}
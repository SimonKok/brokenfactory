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

package gamejam.ui {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import gamejam.game.World;
	import gamejam.Intersect;
	import gamejam.Main;
	
	/**
	 * ...
	 * @author Simon Kok
	 */
	public class Home extends MovieClip {
		private var background:MovieClip;
		private var playButton:MovieClip;
		
		/**
		 * construct home screen
		 */
		public function Home() {
			background = new BackgroundStartscherm();
			this.addChild(background);
			background.x = -34;
			background.y = -30;
			
			playButton = new PlayButton();
			this.addChild(playButton);
			playButton.x = Intersect.getStage().stageWidth / 2 - 120;
			playButton.y = Intersect.getStage().stageHeight / 2 - 60;
			playButton.addEventListener(MouseEvent.MOUSE_UP, playPressed);
		}
		
		/**
		 * 
		 * @param	e
		 */
		private function playPressed(e:MouseEvent):void {
			Main.ui.visible = false;
			World.start();
		}
	}

}
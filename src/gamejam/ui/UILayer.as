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
	import gamejam.game.World;
	import gamejam.Intersect;
	/**
	 * ...
	 * @author Simon Kok
	 */
	public class UILayer extends MovieClip {
		private var homeScreen:Home;
		public var creditScreen:MovieClip;
		
		public function UILayer() {
			homeScreen = new Home();
			creditScreen = new Credits();
			
			addChild(homeScreen);
			addChild(creditScreen);
			
			creditScreen.visible = false;
		}
		
		public function home():void {
			World.reset();
			World.playing = false;
			homeScreen.visible = true;
			creditScreen.visible = false;
			this.visible = true;
			//Intersect.getGame().visible = false;
		}
		
		public function credits():void {
			creditScreen.visible = true;
			this.visible = true;
		}
	}

}
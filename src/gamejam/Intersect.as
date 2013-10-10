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
	import flash.display.Stage;
	import gamejam.game.World;
	/**
	 * ...
	 * @author Simon Kok
	 */
	public class Intersect {
		private static var _stage:Stage;
		private static var game:MovieClip;
		
		/**
		 * 
		 * @return
		 */
		public static function getStage():Stage {
			return _stage;
		}
		
		/**
		 * 
		 * @param	s
		 */
		public static function setStage(s:Stage):void {
			_stage = s;
		}
		/**
		 * 
		 * @return
		 */
		public static function getGame():MovieClip {
			return game;
		}
		
		/**
		 * 
		 * @param	g
		 */
		public static function setGame(g:MovieClip):void {
			game = g;
		}
	}
}
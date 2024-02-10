/**
 * ...
 * @author Ormael
 */
package classes.Items.Weapons
{
	import classes.Items.Weapon;
	import classes.PerkLib;
	import classes.Player;

	public class DualBFSword extends Weapon {
		
		public function DualBFSword() {
			super("DBFSwo", "D.B.F.Sword", "dual big fucking swords", "a pair of big fucking swords", "slash", 50, 4000, "Big Fucking Swords - the best solution for a tiny e-pen complex at this side of the Mareth!  This pair of 2H 2,5 meters long swords requires 150 strength to fully unleash their power.", "Dual Large, LGWrath", "Sword");
		}
		
		override public function get attack():Number {
			var boost:int = 0;
			if (game.player.str >= 150) boost += 20;
			if (game.player.str >= 100) boost += 15;
			if (game.player.str >= 50) boost += 10;
			return (5 + boost);
		}
		
		override public function canEquip(doOutput:Boolean):Boolean {
			if ((game.player.hasPerk(PerkLib.DualWield) && (game.player.hasPerk(PerkLib.GigantGrip) || game.player.hasPerk(PerkLib.AntyDexterity))) || (game.player.hasPerk(PerkLib.GigantGrip) && game.player.hasPerk(PerkLib.AntyDexterity))) {
				return super.canEquip(doOutput);
			}
			if (!game.player.hasPerk(PerkLib.GigantGrip) && !game.player.hasPerk(PerkLib.AntyDexterity)) {
				if (doOutput) outputText("You aren't skilled enough to handle this pair of weapons!  ");
				return false;
			}
			if (doOutput) outputText("You aren't skilled in handling large weapons with one hand yet to effectively use those swords. Unless you want to hurt yourself instead of your enemies when trying to use them...  ");
			return false;
		}
	}
}

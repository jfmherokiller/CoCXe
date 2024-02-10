/**
 * ...
 * @author Liadri
 */
package classes.Items.Armors
{
import classes.Items.Armor;
import classes.Items.ItemTags;
import classes.PerkLib;
import classes.Player;
import classes.StatusEffects;

	public class TamamoNoMaeCursedKimono extends Armor {
		
		public function TamamoNoMaeCursedKimono()
		{
			super("T.C.Kimono","T.C.Kimono","Tamamo no Mae Cursed Kimono","a Tamamo no Mae Cursed Kimono",10,60,12000,"It is said that this beautiful Kimono decorated with flower motifs was worn by lady Tamamoe, last leader of the kitsunes, before she fell from grace into a Kumiho. Increase the potency of spells and soulskill by up to 50% based on corruption and empower all Kitsunes ability. Like most kitsune outfit this Kimono is made to improve ones charms and thus leaves you as agile as if naked.","Light");
			withBuffs({
				'spellcost': -0.60,
				'teasedmg': +15
			});
			withPerk(PerkLib.TamamoNoMaeCursedKimono,0,0,0,0);
			withTag(ItemTags.A_REVEALING);
			withTag(ItemTags.I_LEGENDARY);
		}
		
		override public function get def():Number{
			var mod:int = game.player.cor/20;
			return 5 + mod;
		}
		override public function get mdef():Number{
			var mod:int = game.player.cor/5;
			return 40 + mod;
		}
	}
}

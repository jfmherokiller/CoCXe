/**
 * ...
 * @author Ormael
 */
package classes.Items.Weapons 
{
	import classes.GlobalFlags.kFLAGS;
	import classes.CoC;
	import classes.Items.Weapon;
	import classes.Scenes.SceneLib;
	import classes.PerkLib;
	import classes.Player;
	
	public class NecroWand extends Weapon
	{
		
		public function NecroWand() 
		{
			super("NecroWa", "necrowand", "necro wand", "a necro wand", "smack", 2, 1280,
					"A simple wand made from bones. Increase user mastery over animated bone constructs.",
					"Wand", WT_WAND
			);
			withBuff('spellpower', +0.1);
		}
		
		override public function afterEquip(doOutput:Boolean):void {
			SceneLib.setItemsChecks.equipNecroItemsSet();
			super.afterUnequip(doOutput);
		}
		
		override public function afterUnequip(doOutput:Boolean):void {
			if ((CoC.instance.player.perkv2(PerkLib.PrestigeJobNecromancer) - 1) > SceneLib.campMakeWinions.maxSkeletonWarriors() || (CoC.instance.player.perkv1(PerkLib.GreaterHarvest) - 1) > SceneLib.campMakeWinions.maxSkeletonArchers() || (CoC.instance.player.perkv2(PerkLib.GreaterHarvest) - 1) > SceneLib.campMakeWinions.maxSkeletonMages()) {
				outputText("\n\nAfter you unequip necro wand some of your skeletons falls apart due to not enough control to sustain them. You gather leftover bones for future use.  ");
				if ((CoC.instance.player.perkv2(PerkLib.PrestigeJobNecromancer) - 1) > SceneLib.campMakeWinions.maxSkeletonWarriors()) {
					CoC.instance.player.addPerkValue(PerkLib.PrestigeJobNecromancer, 2, -1);
					CoC.instance.player.addPerkValue(PerkLib.PrestigeJobNecromancer, 1, 20);
				}
				if ((CoC.instance.player.perkv1(PerkLib.GreaterHarvest) - 1) > SceneLib.campMakeWinions.maxSkeletonArchers()) {
					CoC.instance.player.addPerkValue(PerkLib.GreaterHarvest, 1, -1);
					CoC.instance.player.addPerkValue(PerkLib.PrestigeJobNecromancer, 1, 20);
				}
				if ((CoC.instance.player.perkv2(PerkLib.GreaterHarvest) - 1) > SceneLib.campMakeWinions.maxSkeletonMages()) {
					CoC.instance.player.addPerkValue(PerkLib.GreaterHarvest, 2, -1);
					CoC.instance.player.addPerkValue(PerkLib.PrestigeJobNecromancer, 1, 20);
				}
			}
			SceneLib.setItemsChecks.unequipNecroItemsSet();
			super.afterUnequip(doOutput);
		}
	}
}
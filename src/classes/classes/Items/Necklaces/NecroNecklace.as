/**
 * ...
 * @author Ormael
 */
package classes.Items.Necklaces 
{
	import classes.GlobalFlags.kFLAGS;
	import classes.CoC;
	import classes.Items.Necklace;
	import classes.Scenes.SceneLib;
	import classes.PerkLib;
	import classes.Player;
	
	public class NecroNecklace extends Necklace
	{
		
		public function NecroNecklace() 
		{
			super("NecroNe", "necronecklace", "necro necklace", "a necro necklace", 0, 0, 1200, "A simple necklace made from bones. Increase user mastery over animated bone constructs. \n\nType: Jewelry (Necklace) \nBase value: 4,500 \nSpecial: Increases by 1 control over skeletons of any type.", "Necklace");
		}
		
		override public function afterEquip(doOutput:Boolean):void {
			SceneLib.setItemsChecks.equipNecroItemsSet();
			super.afterUnequip(doOutput);
		}
		
		override public function afterUnequip(doOutput:Boolean):void {
			if ((CoC.instance.player.perkv2(PerkLib.PrestigeJobNecromancer) - 1) > SceneLib.campMakeWinions.maxSkeletonWarriors() || (CoC.instance.player.perkv1(PerkLib.GreaterHarvest) - 1) > SceneLib.campMakeWinions.maxSkeletonArchers() || (CoC.instance.player.perkv2(PerkLib.GreaterHarvest) - 1) > SceneLib.campMakeWinions.maxSkeletonMages()) {
				outputText("\n\nAfter you unequip necro necklace some of your skeletons falls apart due to not enough control to sustain them. You gather leftover bones for future use.  ");
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
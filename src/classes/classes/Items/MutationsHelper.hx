package classes.Items {
import classes.*;
import classes.Items.Alchemy.AlchemyLib;

/**
	 * Helper class to get rid of the copy&paste-mess in classes.Items.Mutations
	 * @since July 8, 2016
	 * @author Stadler76
	 */
	public class MutationsHelper extends AlchemyLib
	{

    public var changes:int = 0;
		public var changeLimit:int = 1;

		public function MutationsHelper() { }

	/**
	 * Initializes changes=0 and changeLimit to (1..maxChanges) + perk bonuses
	 * @param name
	 * @param maxChanges
	 * @return
	 */
	protected function mutationStart(name:String, maxChanges:int):int {
		changes     = 0;
		changeLimit = 1;
		for (var i:int = 2; i <= maxChanges; i++) {
			if (rand(i) == 0) changeLimit++;
		}
		if (player.hasPerk(PerkLib.HistoryAlchemist) || player.hasPerk(PerkLib.PastLifeAlchemist)) changeLimit++;
		if (player.hasPerk(PerkLib.Enhancement)) changeLimit++;
		if (player.hasPerk(PerkLib.Fusion)) changeLimit++;
		if (player.hasPerk(PerkLib.Enchantment)) changeLimit++;
		if (player.hasPerk(PerkLib.Refinement)) changeLimit++;
		if (player.hasPerk(PerkLib.Saturation)) changeLimit++;
		if (player.hasPerk(PerkLib.Perfection)) changeLimit++;
		if (player.hasPerk(PerkLib.Creationism)) changeLimit++;
		if (player.hasPerk(PerkLib.EzekielBlessing)) changeLimit++;
		if (player.hasPerk(PerkLib.TransformationResistance)) changeLimit--;
		if (player.hasPerk(PerkLib.TransformationAcclimation)) changeLimit*2;
		return changes;
	}
	/**
	 * If:
	 * * changes < changeLimit
	 * * `condition` is 'true'
	 * * random*rarity < 1  (equivalent to (rand(rarity) = 0) for `rarity:int`)
	 * Then:
	 * * call `code`
	 * * changes++
	 * * return true
	 * Else:
	 * * return false
	 */
	protected function mutationStep(condition:Boolean, rarity:Number, code:Function):Boolean {
		if (changes < changeLimit
			&& condition
			&& Math.random() * rarity < 1) {
			code();
			changes++;
			return true;
		} else {
			return false;
		}
	}
}
}

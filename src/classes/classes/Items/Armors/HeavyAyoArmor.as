/**
 * ...
 * @author Ormael
 */
package classes.Items.Armors
{
	import classes.GlobalFlags.kFLAGS;
	import classes.ItemType;
	import classes.Items.Armor;
	import classes.Player;
	import classes.EngineCore;

	public class HeavyAyoArmor extends Armor {
		
		public function HeavyAyoArmor() {//100 * armor + mres
			super("HAyoArm","HAyoArm","heavy ayo armor","a heavy ayo armor",120,20,14000,"This suit of armor is more than typical heavy armor - it have added pieces of Ayo Tech that increase by a huge margin it properties as long user is capable to feed it on regular basis with soulforce.","Heavy Ayo");
		}
		
		override public function get def():Number {
			if (game.flags[kFLAGS.SOULFORCE_STORED_IN_AYO_ARMOR] > 0) return 120;
			else return 72;
		}
		
		override public function get mdef():Number {
			if (game.flags[kFLAGS.SOULFORCE_STORED_IN_AYO_ARMOR] > 0) return 20;
			else return 12;
		}

		override public function afterEquip(doOutput:Boolean):void {
			if (!game.isLoadingSave) {
				var oldHPratio:Number = game.player.hp100/100;
				game.flags[kFLAGS.SOULFORCE_STORED_IN_AYO_ARMOR] = 0;
				game.player.buff("Ayo Armor").remove();
				game.player.buff("Ayo Armor").addStats( {"str.mult":-0.20, "spe.mult":-0.20} );
				game.player.HP = oldHPratio*game.player.maxHP();
				EngineCore.statScreenRefresh();
			}
			super.afterEquip(doOutput);
		}
		
		override public function afterUnequip(doOutput:Boolean):void {
			if (game.flags[kFLAGS.SOULFORCE_STORED_IN_AYO_ARMOR] > 0) {
				game.player.soulforce += game.flags[kFLAGS.SOULFORCE_STORED_IN_AYO_ARMOR];
				if (game.player.soulforce > game.player.maxOverSoulforce()) game.player.soulforce = game.player.maxOverSoulforce();
				game.flags[kFLAGS.SOULFORCE_STORED_IN_AYO_ARMOR] = 0;
			}
			game.player.buff("Ayo Armor").remove();
			super.afterUnequip(doOutput);
		}
		
		override public function canEquip(doOutput:Boolean):Boolean {
			if (game.player.str >= 40 && game.player.spe >= 40) return super.canEquip(doOutput);
			if(doOutput) outputText("You aren't strong and agile enough to wear this armor!  Unless you likes to move slower than snail and hit weaked than wet noddle!  ");
			return false;
		}
	}
}

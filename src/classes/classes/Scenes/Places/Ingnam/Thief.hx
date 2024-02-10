package classes.Scenes.Places.Ingnam
{
import classes.*;
import classes.BodyParts.Butt;
import classes.BodyParts.Hips;
import classes.Scenes.SceneLib;
import classes.internals.*;

public class Thief extends Monster
	{
		
		
		override public function defeated(hpVictory:Boolean):void
		{
			SceneLib.ingnam.thiefScene.winAgainstThief();
		}
		
		public function Thief()
		{
			this.a = "the ";
			this.short = "thief";
			this.imageName = "thief";
			this.long = "The thief standing before you is a human.  His skin is fairly pale and his hair is brown.  He's wearing a set of leather armor and wielding a dagger in his right hand.  He's intent on knocking you out so he can take your gems.";
			// this.plural = false;
			this.createCock();
			createBreastRow(Appearance.breastCupInverse("flat"));
			this.ass.analLooseness = AssClass.LOOSENESS_NORMAL;
			this.ass.analWetness = AssClass.WETNESS_NORMAL;
			this.tallness = 5*12 + 5 + rand(4);
			this.hips.type = Hips.RATING_BOYISH;
			this.butt.type = Butt.RATING_TIGHT;
			this.bodyColor = "light";
			this.hairColor = "brown";
			this.hairLength = 4;
			initStrTouSpeInte(7, 5, 5, 8);
			initWisLibSensCor(8, 7, 9, 20);
			this.weaponName = "knife";
			this.weaponVerb = "slash";
			this.weaponAttack = 2;
			this.armorName = "leather armor";
			this.armorDef = 2;
			this.armorMDef = 0;
			this.bonusLust = 24;
			this.lust = 17;
			this.level = 1;
			this.gems = 10+rand(5);
			this.drop = new WeightedDrop()
					.add(armors.LEATHRA,1)
					.add(weapons.DAGGER,2)
					.add(null,8);
			this.createPerk(PerkLib.EnemyForBeginnersType, 0, 0, 0, 0);
			checkMonster();
		}
	}
}
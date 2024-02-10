/**
 * ...
 * @author Liadri
 */
package classes.Scenes.Areas.Caves
{
import classes.*;
import classes.BodyParts.Butt;
import classes.BodyParts.Hips;
import classes.BodyParts.LowerBody;
import classes.Scenes.Monsters.DarkElfs;
import classes.internals.*;

public class DarkElfSniperCaves extends DarkElfs
	{
		public function DarkElfSniperCaves()
		{
			this.a = "the ";
			this.short = "dark elf sniper";
			this.imageName = "dark elf";
			this.long = "This woman with dark skin has long pointed ears. You suspect her to be a dark elf and fighting underground on her own turf you are almost worried more of her kind would join the battle. Regardless, she’s dangerous and seems well equipped.";
			this.createVagina(false, VaginaClass.WETNESS_SLAVERING, VaginaClass.LOOSENESS_NORMAL);
			this.createStatusEffect(StatusEffects.BonusVCapacity, 50, 0, 0, 0);
			createBreastRow(Appearance.breastCupInverse("C"));
			this.ass.analLooseness = AssClass.LOOSENESS_NORMAL;
			this.ass.analWetness = AssClass.WETNESS_MOIST;
			this.tallness = 72;
			this.hips.type = Hips.RATING_CURVY + 1;
			this.butt.type = Butt.RATING_JIGGLY;
			this.lowerBody = LowerBody.ELF;
			this.bodyColor = "dark";
			this.hairColor = "silver";
			this.hairLength = 13;
			initStrTouSpeInte(165, 250, 290, 160);
			initWisLibSensCor(160, 90, 101, 95);
			this.weaponName = "dagger";
			this.weaponVerb= "stab";
			this.weaponAttack = 5;
			this.weaponRangeName = "elven bow";
			this.weaponRangeVerb= "shoot";
			this.weaponRangeAttack = 43;
			this.armorName = "elven black armor";
			this.armorDef = 20;
			this.armorMDef = 20;
			this.bonusLust = 256;
			this.lustVuln = .7;
			this.lust = 50;
			this.level = 65;
			this.gems = rand(10) + 25;
			this.drop = new WeightedDrop().
					add(useables.EBONBLO,1/20).
					add(weaponsrange.BOWLIGH,1)/*.
					add(consumables.ELFEARS,4)*/;
			checkMonster();
		}
	}
}
